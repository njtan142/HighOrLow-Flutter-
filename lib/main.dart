import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _leftnum = 0;
  int _rightnum = 0;

  @override
  initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _changeNum());
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  void _changeNum() {
    setState(() {
      _leftnum = Random().nextInt(100);
      _rightnum = Random().nextInt(100);
    });
  }

  void _high() {
    if (_leftnum > _rightnum) {
      _incrementCounter();
    } else {
      _decrementCounter();
    }
    _changeNum();
  }

  void _low() {
    if (_leftnum < _rightnum) {
      _incrementCounter();
    } else {
      _decrementCounter();
    }
    _changeNum();
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
            Text(
              'Score: $_counter',
              style: Theme.of(context).textTheme.headline2,
            ),
            const SizedBox(height: 100),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$_leftnum compared to $_rightnum',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            ),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: _high,
                  child: const Text('Higher'),
                ),
                const SizedBox(width: 25),
                ElevatedButton(
                  onPressed: _low,
                  child: const Text('Lower'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
