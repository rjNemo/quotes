import 'package:flutter/material.dart';

import 'home.dart';
import 'quote.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: QuotePage(),
      // home: HomePage(title: 'Counter App'),
    );
  }
}
