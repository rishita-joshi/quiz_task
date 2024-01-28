import 'package:flutter/material.dart';
import 'package:quiz_task/pages/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, title: 'Quiz App', home: SplashScreen());
  }
}
