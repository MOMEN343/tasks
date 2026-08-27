import 'package:flutter/material.dart';
import 'package:tasks/core/managers/manager_colors.dart';

class IconContainer extends StatelessWidget {
  final IconData icon;
  const IconContainer({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        color: ManagerColors.secondary,
        borderRadius: BorderRadius.circular(50),
      ),

      child: InkWell(child: Icon(icon, color: Colors.white, size: 20)),
    );
  }
}
