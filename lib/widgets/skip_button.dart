import 'package:flutter/material.dart';
import 'package:tasks/constants/app_color.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(
        "تخطي",
        style: TextStyle(
          color: AppColors.grey,
          decoration: TextDecoration.underline,
          decorationColor: AppColors.grey,
          fontFamily: "Almarai",
        ),
      ),
    );
  }
}
