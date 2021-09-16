import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;
  String _helpText = '';

  void _incrementCounter() {
    setState(() {
      if (_counter < 10) {
        _counter++;
        _helpText = '';
      } else {
        _helpText = '🛑 Now it is too much!';
      }
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) {
        _counter--;
        _helpText = '';
      } else {
        _helpText = "⬆️ We don't deal with negatives …";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Current value:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              _helpText,
              style: Theme.of(context).textTheme.headline5,
            ),
            SizedBox(height: 20), // manual spacing
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FloatingActionButton(
                  onPressed: _decrementCounter,
                  tooltip: 'Decrement',
                  child: Icon(Icons.remove),
                  backgroundColor: Colors.red,
                ),
                FloatingActionButton(
                  onPressed: _incrementCounter,
                  tooltip: 'Increment',
                  child: Icon(Icons.add),
                  backgroundColor: Colors.green,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
