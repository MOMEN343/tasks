import 'package:flutter/material.dart';
import 'package:tasks/core/managers/manager_colors.dart';
import 'package:tasks/features/authentication/managers/manager_styles.dart';

class LoginButton extends StatelessWidget {
  final String textButton;
  final VoidCallback onPressed;
  const LoginButton({
    super.key,
    required this.textButton,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,

      style: ElevatedButton.styleFrom(
        backgroundColor: ManagerColors.primary,
        textStyle: ManagerStyles.regularText,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),

        minimumSize: Size(MediaQuery.of(context).size.width, 44),
      ),
      child: Text(textButton),
    );
  }
}
