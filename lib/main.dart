import 'package:flutter/material.dart';
import 'package:durations/pages/duration.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  Future<void> initPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getBool("darkMode") == null) {
      prefs.setBool("darkMode", true);
    }
  }

  @override
  Widget build(BuildContext context) {
    initPrefs();
    return new DynamicTheme(
      defaultBrightness: Brightness.dark,
      data: (brightness) => new ThemeData(  // bit messy
        brightness: brightness == Brightness.dark ? Brightness.dark : Brightness.light,
        accentColor: brightness == Brightness.dark ? Colors.purple : Colors.pink,
        primarySwatch:  brightness == Brightness.dark ? Colors.purple : Colors.pink,
        primaryColor:  brightness == Brightness.dark ? Color.fromARGB(255, 18, 18, 18) : Color.fromARGB(255, 237, 237, 237),
        primaryTextTheme: TextTheme(
          headline: TextStyle(fontSize: 48.0, fontFamily: 'Dohyeon', fontWeight: FontWeight.bold, color:  brightness == Brightness.dark ? Colors.white70 : Colors.black87),
          title: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold, fontFamily: 'Hind', color:  brightness == Brightness.dark ? Colors.white70 : Colors.black87),
          body1: TextStyle(fontSize: 14.0, fontFamily: 'Dohyeon', color:  brightness == Brightness.dark ? Colors.white70 : Colors.black87),
        )
      ),
      themedWidgetBuilder: (context, theme) {
        return new MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Durations',
          theme: theme,
          home: DurationPage(),
        );
      },
    );
  }
}