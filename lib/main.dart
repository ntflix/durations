import 'package:flutter/material.dart';
import 'package:durations/pages/duration.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Durations',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        primaryColor: Colors.pink,
        primaryColorDark: Colors.purpleAccent,
        primaryTextTheme: TextTheme(
          headline: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
          title: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold, fontFamily: 'Hind'),
          body1: TextStyle(fontSize: 14.0, fontFamily: 'Dohyeon'),
        )
      ),
      home: First(),
    );
  }
}

class First extends StatefulWidget {
  First({Key key}) : super(key: key);

  @override
  _FirstState createState() {
    return _FirstState();
  }
}

class _FirstState extends State<First> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DurationPage();
  }
}