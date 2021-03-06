import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class DurationPage extends StatefulWidget {
  DurationPage({Key key}) : super(key: key);

  @override
  _DurationPageState createState() {
    return _DurationPageState();
  }
}

class _DurationPageState extends State<DurationPage> {
  List<TextEditingController> _controllers = [
    new TextEditingController(),
    new TextEditingController(),
    new TextEditingController(),
    new TextEditingController(),
  ];
  List<String> inputs = List.filled(4, "0");
  final numColumns = 4;
  var value = true;
  Duration duration = Duration(seconds: 0);
  int seconds = 0;
  int minutes = 0;
  int hours = 0;
  int days = 0;

  void setDurations() {
    List<int> values = new List.filled(4, 0);

    for (int i = 0; i < 4; i++) {
      try {
        values[i] = int.parse(inputs[i]);
      } catch (error) {
        // don't need a "values[i] = 0" because it's filled with 0s already
        // not going to do anything here, it would ruin the app's style
      }
    }

    ///
    /// There is a slight issue with the duration thing.
    /// When dealing with really big values, like 99999999 days,
    /// the duration overflows and returns an incorrect value.
    ///

    var total = Duration(days: values[0], hours: values[1], minutes: values[2], seconds: values[3]);
    this.days = total.inDays;
    this.hours = (total.inHours - days * 24);
    this.minutes = (total.inMinutes - (hours * 60 + days * 1440));
    this.seconds = (total.inSeconds - (minutes * 60 + hours * 3600 + days * 86400)); // this code hahahahahaaaaa lmaoo oops
  }

  void _clear() {
    duration = Duration(seconds: 0);
    seconds = 0;
    minutes = 0;
    hours = 0;
    days = 0;
    _controllers.forEach((controller) => controller.clear());
    for (int i = 0; i < inputs.length; i++) {
      inputs[i] = "";
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {
        _clear();
      },
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
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
                margin: EdgeInsets.only(top: 10),
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width / numColumns,
                      child: Center(child: Text("D", style: Theme.of(context).textTheme.body1.copyWith(fontSize: 20))),
                      // yeah you could make a default style variable instead of all this but i haven't
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / numColumns,
                      child: Center(child: Text("H", style: Theme.of(context).textTheme.body1.copyWith(fontSize: 20))),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / numColumns,
                      child: Center(child: Text("M", style: Theme.of(context).textTheme.body1.copyWith(fontSize: 20))),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / numColumns,
                      child: Center(child: Text("S", style: Theme.of(context).textTheme.body1.copyWith(fontSize: 20))),
                    )
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 60,
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / numColumns,
                      child: TextField(
                        onChanged: (value) {
                          inputs[0] = value; // one could add a watcher/observer to the 'inputs[]' variable but it doesn't really matter
                          setState(() {
                            setDurations();
                          });
                        },
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.title.copyWith(fontSize: 22),
                        controller: _controllers[0],
                        maxLength: 8,
                        buildCounter: (BuildContext context, {int currentLength, int maxLength, bool isFocused}) => null,
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(borderSide: BorderSide(color: Theme.of(context).accentColor)),
                          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Theme.of(context).accentColor)),
                          hintText: "000",
                          hintStyle: Theme.of(context).primaryTextTheme.title.copyWith(fontSize: 22, color: Colors.grey),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / numColumns,
                      child: TextField(
                          onChanged: (value) {
                            inputs[1] = value;
                            setState(() {
                              setDurations();
                            });
                          },
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.title.copyWith(fontSize: 22),
                          controller: _controllers[1],
                          maxLength: 8,
                          buildCounter: (BuildContext context, {int currentLength, int maxLength, bool isFocused}) => null,
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(borderSide: BorderSide(color: Theme.of(context).accentColor)),
                            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Theme.of(context).accentColor)),
                            hintText: "000",
                            hintStyle: Theme.of(context).primaryTextTheme.title.copyWith(fontSize: 22, color: Colors.grey),
                          )),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / numColumns,
                      child: TextField(
                          onChanged: (value) {
                            inputs[2] = value;
                            setState(() {
                              setDurations();
                            });
                          },
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.title.copyWith(fontSize: 22),
                          controller: _controllers[2],
                          maxLength: 8,
                          buildCounter: (BuildContext context, {int currentLength, int maxLength, bool isFocused}) => null,
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(borderSide: BorderSide(color: Theme.of(context).accentColor)),
                            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Theme.of(context).accentColor)),
                            hintText: "000",
                            hintStyle: Theme.of(context).primaryTextTheme.title.copyWith(fontSize: 22, color: Colors.grey),
                          )),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / numColumns,
                      child: TextField(
                        onChanged: (value) {
                          inputs[3] = value;
                          setState(() {
                            setDurations();
                          });
                        },
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.title.copyWith(fontSize: 22),
                        controller: _controllers[3],
                        maxLength: 8,
                        buildCounter: (BuildContext context, {int currentLength, int maxLength, bool isFocused}) => null,
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(borderSide: BorderSide(color: Theme.of(context).accentColor)),
                          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Theme.of(context).accentColor)),
                          hintText: "000",
                          hintStyle: Theme.of(context).primaryTextTheme.title.copyWith(fontSize: 22, color: Colors.grey), // I really should make an object instead of just copying code
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 40),
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width / numColumns,
                      child: Center(child: Text("D", style: Theme.of(context).textTheme.body1.copyWith(fontSize: 20))),
                      // yeah you could make a default style variable instead of all this but i haven't
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / numColumns,
                      child: Center(child: Text("H", style: Theme.of(context).textTheme.body1.copyWith(fontSize: 20))),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / numColumns,
                      child: Center(child: Text("M", style: Theme.of(context).textTheme.body1.copyWith(fontSize: 20))),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / numColumns,
                      child: Center(child: Text("S", style: Theme.of(context).textTheme.body1.copyWith(fontSize: 20))),
                    )
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 120,
                child: Row(
                  children: [
                    Container(width: MediaQuery.of(context).size.width / numColumns, child: Center(child: Text(days.toString(), style: Theme.of(context).primaryTextTheme.headline.copyWith(fontSize: (MediaQuery.of(context).size.width / numColumns) / days.toString().length)))),
                    Container(width: MediaQuery.of(context).size.width / numColumns, child: Center(child: Text(hours.toString(), style: Theme.of(context).primaryTextTheme.headline.copyWith(fontSize: (MediaQuery.of(context).size.width / numColumns) / hours.toString().length)))),
                    Container(width: MediaQuery.of(context).size.width / numColumns, child: Center(child: Text(minutes.toString(), style: Theme.of(context).primaryTextTheme.headline.copyWith(fontSize: (MediaQuery.of(context).size.width / numColumns) / minutes.toString().length)))),
                    Container(width: MediaQuery.of(context).size.width / numColumns, child: Center(child: Text(seconds.toString(), style: Theme.of(context).primaryTextTheme.headline.copyWith(fontSize: (MediaQuery.of(context).size.width / numColumns) / seconds.toString().length)))),
                  ],
                ),
              ),
              Container(margin: EdgeInsets.only(top: 10), child: Text("double tap to clear", style: Theme.of(context).primaryTextTheme.title.copyWith(fontSize: 22, color: Colors.grey))),
            ],
          ),
        ),
      ),
    );
  }
}
