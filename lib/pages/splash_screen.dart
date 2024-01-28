import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:quiz_task/main.dart';
import 'package:quiz_task/pages/quiz_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnimatedSplashScreen(
      duration: 3000,
      splash: Icon(
        Icons.quiz_sharp,
        color: Colors.white,
        size: 60,
      ),
      nextScreen: QuizPage(),
      splashTransition: SplashTransition.sizeTransition,
      backgroundColor: Colors.blueGrey.shade800,
    ));
  }
}
