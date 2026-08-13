import 'package:flutter/material.dart';
import 'package:tasks/core/managers/manager_colors.dart';

class SplashScreen2 extends StatelessWidget {
  const SplashScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ManagerColors.primary,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 50),
        child: Center(
          child: Image(image: AssetImage("assets/images/splash_screen2.png")),
        ),
      ),
    );
  }
}
