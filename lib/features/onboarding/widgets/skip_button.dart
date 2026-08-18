import 'package:flutter/material.dart';
import 'package:tasks/core/managers/manager_colors.dart';
import 'package:tasks/core/managers/manager_strings.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
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
