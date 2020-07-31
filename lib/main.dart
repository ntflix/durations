import 'package:flutter/material.dart';
import 'package:durations/pages/duration.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  Future<void> initPrefs() async {
    // try {
    //   SharedPreferences prefs = await SharedPreferences.getInstance();
    //   if (prefs.getBool("darkMode") == null) {
    //     prefs.setBool("darkMode", true);
    //   }
    // } catch (_) {
    //   print("Shared preferences not supported on this platform.");
    // }
  }

  @override
  Widget build(BuildContext context) {
    // initPrefs();
    final brightness = Theme.of(context).brightness;

    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Durations',
      darkTheme: ThemeData(
        // bit messy
        brightness: Brightness.dark,
        accentColor: Colors.white,
        primarySwatch: Colors.red,
        primaryColor: Color.fromARGB(255, 18, 18, 18),
        primaryTextTheme: TextTheme(
          headline: TextStyle(fontSize: 48.0, fontFamily: 'Dohyeon', fontWeight: FontWeight.bold, color: Colors.white70),
          title: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold, fontFamily: 'Hind', color: Colors.white70),
          body1: TextStyle(fontSize: 14.0, fontFamily: 'Dohyeon', color: Colors.white70),
        ),
      ),
      theme: ThemeData(
        // bit messy
        brightness: Brightness.light,
        accentColor: Colors.black,
        primarySwatch: Colors.pink,
        primaryColor: Color.fromARGB(255, 237, 237, 237),
        primaryTextTheme: TextTheme(
          headline: TextStyle(fontSize: 48.0, fontFamily: 'Dohyeon', fontWeight: FontWeight.bold, color: Colors.black87),
          title: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold, fontFamily: 'Hind', color: Colors.black87),
          body1: TextStyle(fontSize: 14.0, fontFamily: 'Dohyeon', color: Colors.black87),
        ),
      ),
      home: DurationPage(),
    );
  }
}
