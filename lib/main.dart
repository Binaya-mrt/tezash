import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:day_1/onboarding_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// whenever your initialization is completed, remove the splash screen:

const Color themeColor = Color(0xff463F97);

class MyApp extends StatelessWidget {
  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: 'assets/images/splash.png',
      nextScreen: OnBoard(),
      splashTransition: SplashTransition.fadeTransition,
    );
  }
}
