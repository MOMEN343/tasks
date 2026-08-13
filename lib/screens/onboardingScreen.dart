import 'package:flutter/material.dart';
import 'package:tasks/screens/onboarding1.dart';
import 'package:tasks/screens/onboarding2.dart';
import 'package:tasks/screens/onboarding3.dart';

class Onboardingscreen extends StatefulWidget {
  const Onboardingscreen({super.key});

  @override
  State<Onboardingscreen> createState() => _Onboardingscreen();
}

class _Onboardingscreen extends State<Onboardingscreen> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        reverse: true,
        itemCount: 3,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Onboarding1(controller: _pageController);
          } else if (index == 1) {
            return Onboarding2(controller: _pageController);
          } else {
            return Onboarding3();
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
