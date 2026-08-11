import 'package:flutter/material.dart';
import 'package:tasks/constants/app_color.dart';

class ArrowButton extends StatelessWidget {
  final IconData icon;

  const ArrowButton({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        minimumSize: Size(0, 0),
        padding: EdgeInsets.all(12),
      ),
      onPressed: () {},
      child: Icon(icon, color: Colors.white),
    );
  }
}
