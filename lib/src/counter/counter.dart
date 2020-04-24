import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  CounterScreen({Key key}) : super(key: key);

  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  final _styleText = TextStyle(fontSize: 25);
  int _counter = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Statefull"),
        leading: Icon(Icons.remove),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Numero de tabs:',
            style: _styleText,
          ),
          Text(
            "$_counter",
            style: _styleText,
          ),
        ],
      )),
      floatingActionButton: _createFloatingActionButton(),
    );
  }

  Widget _createFloatingActionButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        SizedBox(
          width: 30.0,
        ),
        FloatingActionButton(
          onPressed: () {
            reset();
          },
          child: Icon(Icons.exposure_zero),
          tooltip: 'Reset Counter',
        ),
        Expanded(
          child: SizedBox(),
        ),
        FloatingActionButton(
          onPressed: () {
            removeOne();
          },
          child: Icon(Icons.exposure_neg_1),
          tooltip: 'Decrement Counter',
        ),
        SizedBox(
          width: 5.0,
        ),
        FloatingActionButton(
          onPressed: () {
            addOne();
          },
          child: Icon(Icons.exposure_plus_1),
          tooltip: 'Increment Counter',
        )
      ],
    );
  }

  void addOne() {
    setState(() {
      _counter++;
    });
  }

  void removeOne() {
    setState(() {
      _counter--;
    });
  }

  void reset() {
    setState(() {
      _counter = 0;
    });
  }
}
