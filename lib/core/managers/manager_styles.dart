import 'package:flutter/material.dart';
import 'manager_colors.dart';
import 'manager_font_family.dart';
import 'manager_font_size.dart';
import 'manager_font_size.dart';

class ManagerStyles {
  static const TextStyle regular = TextStyle(
    color: ManagerColors.grey,
    fontFamily: ManagerFontFamily.almarai,
    fontSize: ManagerFontSize.small,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle bold = TextStyle(
    fontFamily: ManagerFontFamily.almarai,
    fontSize: ManagerFontSize.medium,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle title = TextStyle(
    color: Colors.white,
    fontFamily: ManagerFontFamily.almarai,
    fontSize: ManagerFontSize.large,
    fontWeight: FontWeight.w700,
  );
}
