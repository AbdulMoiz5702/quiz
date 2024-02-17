import 'package:flutter/material.dart';
import 'package:quiz/splahScreen.dart';

import 'home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vocabulary Quiz',
      theme: ThemeData(
        appBarTheme:const AppBarTheme(
          backgroundColor: Colors.purple,
          elevation: 0,
        ),
        scaffoldBackgroundColor: Colors.purpleAccent,
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}







