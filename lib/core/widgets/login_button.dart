import 'package:flutter/material.dart';
import 'package:tasks/core/managers/manager_colors.dart';
import 'package:tasks/features/authentication/managers/manager_styles.dart';

class LoginButton extends StatelessWidget {
  final String textButton;
  final VoidCallback onPressed;
  final double? height;
  final bool isLoading;

  const LoginButton({
    super.key,
    required this.textButton,
    required this.onPressed,
    this.height,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,

        style: ElevatedButton.styleFrom(
          backgroundColor: ManagerColors.primary,
          textStyle: ManagerStyles.regularText,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),

          minimumSize: Size(double.infinity, height ?? 44),
        ),
        child: isLoading
            ? SizedBox(
                width: 22,
                height: 22,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Colors.white,
                ),
              )
            : Text(textButton),
      ),
    );
  }
}
