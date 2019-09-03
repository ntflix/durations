import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class DurationPage extends StatefulWidget {
  DurationPage({Key key}) : super(key: key);

  @override
  _DurationPageState createState() {
    return _DurationPageState();
  }
}

class _DurationPageState extends State<DurationPage> {
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
    return Scaffold(
      appBar: AppBar(
        title: Text("durations"),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(8),
          ),
        ),
      ),

      body: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColorDark
        ),
        child: Column(
          children: <Widget>[

          ],
        ),
      ),
    );
  }
}