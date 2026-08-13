import 'package:flutter/material.dart';
import 'manager_font_family.dart';
import 'manager_font_size.dart';

class ManagerStyles {
  static const TextStyle regular = TextStyle(
    fontFamily: ManagerFontFamily.almarai,
    fontSize: ManagerFontSize.medium,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle bold = TextStyle(
    fontFamily: ManagerFontFamily.almarai,
    fontSize: ManagerFontSize.medium,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle title = TextStyle(
    fontFamily: ManagerFontFamily.almarai,
    fontSize: ManagerFontSize.large,
    fontWeight: FontWeight.w700,
  );
}
