import 'package:flutter/material.dart';
import 'package:tasks/screens/onboarding2.dart';
import 'package:tasks/screens/onboarding3.dart';
import 'package:tasks/screens/onboardingScreen.dart';
import 'screens/onboarding1.dart';
import 'screens/splash_screen.dart';
import 'screens/splash_screen2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Onboardingscreen());
  }
}
