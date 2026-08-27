import 'package:flutter/material.dart';
import 'package:tasks/core/managers/manager_colors.dart';
import 'package:tasks/core/managers/manager_font_family.dart';
import 'manager_font_size.dart';

class ManagerTextStyles {
  static const TextStyle cardTitle = TextStyle(
    fontSize: ManagerFontSize.medium,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle subCardTitle = TextStyle(
    color: ManagerColors.grey,
    fontSize: ManagerFontSize.smaller,
  );
}
