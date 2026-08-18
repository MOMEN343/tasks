import 'package:flutter/material.dart';
import 'package:tasks/core/managers/manager_colors.dart';
import 'package:tasks/core/managers/manager_styles.dart';

class LoginButton extends StatelessWidget {
  final String textButton;
  const LoginButton({super.key, required this.textButton});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},

      style: ElevatedButton.styleFrom(
        backgroundColor: ManagerColors.primary,
        textStyle: ManagerStyles.bold,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),

        minimumSize: Size(MediaQuery.of(context).size.width, 44),
      ),
      child: Text(textButton),
    );
  }
}
