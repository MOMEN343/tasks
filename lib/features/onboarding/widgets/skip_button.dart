import 'package:flutter/material.dart';
import 'package:tasks/core/managers/manager_colors.dart';
import 'package:tasks/features/authentication/screens/login_screen.dart';
import 'package:tasks/features/onboarding/managers/manager_strings.dart';
import 'package:tasks/features/onboarding/screens/onboarding3.dart';

class SkipButton extends StatelessWidget {
  final PageController controller;

  const SkipButton({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        controller.animateToPage(
          2,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      },
      child: Text(
        ManagerStrings.skip,
        style: TextStyle(
          color: ManagerColors.grey,
          decoration: TextDecoration.underline,
          decorationColor: ManagerColors.grey,
          fontFamily: "Almarai",
        ),
      ),
    );
  }
}
