import 'package:boring_app/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Boring App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xff2e277e),
        accentColor: Color(0xffcac6fb),

        textTheme: TextTheme(
          button: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          headline1: TextStyle(fontSize: 24.0,  fontWeight: FontWeight.normal, color: Colors.white),
          headline2: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.white),
        )
      ),
      home: HomeScreen(),
    );
  }
}
