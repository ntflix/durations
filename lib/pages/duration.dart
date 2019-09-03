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
  final numColumns = 3;

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
    List<Text> firstColumn = new List<Text>();
    List<Text> secondColumn = new List<Text>();
    List<Text> thirdColumn = new List<Text>();

    for (int i = 0; i < 10000; i++) {
      firstColumn.add(Text(i.toString(), style: Theme.of(context).textTheme.body1.copyWith(fontSize: 28)));
      secondColumn.add(Text(i.toString(), style: Theme.of(context).textTheme.body1.copyWith(fontSize: 28)));
      thirdColumn.add(Text(i.toString(), style: Theme.of(context).textTheme.body1.copyWith(fontSize: 28)));
    }

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text("durations"),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(8),
          ),
        ),
      ),

      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 8),
              width: MediaQuery.of(context).size.width,
              height: 28,
              child: Row(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width / numColumns,
                    child: Center(child: Text("HOURS", style: Theme.of(context).textTheme.body1.copyWith(fontSize: 20))),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / numColumns,
                    child: Center(child: Text("MINUTES", style: Theme.of(context).textTheme.body1.copyWith(fontSize: 20))),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / numColumns,
                    child: Center(child: Text("SECONDS", style: Theme.of(context).textTheme.body1.copyWith(fontSize: 20))),
                  )
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              child : Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / numColumns,
                    child: CupertinoPicker(
                      looping: true,
                      backgroundColor: Theme.of(context).primaryColor,
                      itemExtent: 32,
                      children: firstColumn,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / numColumns,
                    child: CupertinoPicker(
                      looping: true,
                      backgroundColor: Theme.of(context).primaryColor,
                      itemExtent: 32,
                      children: secondColumn,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / numColumns,
                    child: CupertinoPicker(
                      looping: true,
                      backgroundColor: Theme.of(context).primaryColor,
                      itemExtent: 32,
                      children: thirdColumn,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}