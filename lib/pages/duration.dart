import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:dynamic_theme/dynamic_theme.dart';

class DurationPage extends StatefulWidget {
  DurationPage({Key key}) : super(key: key);

  @override
  _DurationPageState createState() {
    return _DurationPageState();
  }
}

class _DurationPageState extends State<DurationPage> {
  final numColumns = 4;
  var value = true;
  Duration duration = Duration(seconds: 0);

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
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          title: Text("durations"),
          actions:
            [
              Switch(
              value: value,
              onChanged: (val) {
                setState(() {
                  value = val;
                  DynamicTheme.of(context).setBrightness(val ? Brightness.dark: Brightness.light);
                });
              },
              activeColor: DynamicTheme.of(context).data.accentColor,
              inactiveThumbColor: DynamicTheme.of(context).data.accentColor,
              inactiveTrackColor: DynamicTheme.of(context).data.accentColor.withOpacity(0.6),
            ),
          ],
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
                padding: EdgeInsets.only(top: 10),
                width: MediaQuery.of(context).size.width,
                height: 30,
                child: Row(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width / numColumns,
                      child: Center(child: Text("D", style: Theme.of(context).textTheme.body1.copyWith(fontSize: 20))),
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
                child : Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / numColumns,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.body1.copyWith(fontSize: 22),
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(borderSide: BorderSide(color: Theme.of(context).accentColor)),
                          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Theme.of(context).accentColor)),
                          hintText: "000",
                        )
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / numColumns,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.body1.copyWith(fontSize: 22),
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(borderSide: BorderSide(color: Theme.of(context).accentColor)),
                          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Theme.of(context).accentColor)),
                          hintText: "000",
                        )
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / numColumns,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.body1.copyWith(fontSize: 22),
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(borderSide: BorderSide(color: Theme.of(context).accentColor)),
                          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Theme.of(context).accentColor)),
                          hintText: "000",
                        )
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / numColumns,
                      child: TextField(
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.body1.copyWith(fontSize: 22),
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(borderSide: BorderSide(color: Theme.of(context).accentColor)),
                            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Theme.of(context).accentColor)),
                            hintText: "000",
                          )
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}