import 'package:flutter/material.dart';
import 'package:tasks/core/managers/manager_colors.dart';

class ArrowButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;

  const ArrowButton({super.key, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: ManagerColors.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        minimumSize: Size(0, 0),
        padding: EdgeInsets.all(12),
      ),
      onPressed: onPressed,
      child: Icon(icon, color: ManagerColors.buttonTextColor),
    );
  }
}
