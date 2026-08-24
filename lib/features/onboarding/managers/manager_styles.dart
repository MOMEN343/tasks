import 'package:flutter/material.dart';
import 'package:tasks/core/managers/manager_colors.dart';
import 'package:tasks/core/managers/manager_font_family.dart';
import 'manager_font_size.dart';

class ManagerStyles {
  static const TextStyle title = TextStyle(
    color: ManagerColors.primary,
    fontFamily: ManagerFontFamily.almarai,
    fontSize: ManagerFontSize.medium,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle subTitle = TextStyle(
    color: ManagerColors.grey,
    fontFamily: ManagerFontFamily.almarai,
    fontSize: ManagerFontSize.small,
    fontWeight: FontWeight.w400,
  );
}
