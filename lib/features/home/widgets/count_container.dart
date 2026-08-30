import 'package:flutter/material.dart';
import 'package:tasks/core/managers/manager_colors.dart';

class CountContainer extends StatelessWidget {
  final int count;
  const CountContainer({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 43,
      decoration: BoxDecoration(
        border: Border.all(color: ManagerColors.primary),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(child: Text("$count")),
    );
  }
}
