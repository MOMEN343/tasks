import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 50),
        child: Center(
          child: Image(image: AssetImage("assets/images/splash_screen.png")),
        ),
      ),
    );
  }
}
