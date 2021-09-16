import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class QuotePage extends StatefulWidget {
  QuotePage({Key? key}) : super(key: key);

  @override
  _QuoteState createState() => _QuoteState();
}

class _QuoteState extends State<QuotePage> {
  late Future<Quote> futureQuote;

  @override
  void initState() {
    super.initState();
    futureQuote = fetchQuote();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quote of the Day"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FutureBuilder<Quote>(
                future: futureQuote,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(
                          snapshot.data!.body,
                          style: Theme.of(context).textTheme.headline4,
                        ),
                        Text(
                          snapshot.data!.author,
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      ],
                    );
                  }
                  if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  return CircularProgressIndicator();
                }),
          ],
        ),
      ),
    );
  }
}

class Quote {
  String url;
  String author;
  String body;

  Quote({required this.url, required this.author, required this.body});

  factory Quote.fromJson(Map<String, dynamic> json) => Quote(
        url: json['quote']['url'],
        author: json['quote']['author'],
        body: json['quote']['body'],
      );
}

Future<Quote> fetchQuote() async {
  final response = await http.get(Uri.https('favqs.com', 'api/qotd'));
  if (response.statusCode != 200) {
    throw Exception(response.statusCode);
  }
  return Quote.fromJson(jsonDecode(response.body));
}
