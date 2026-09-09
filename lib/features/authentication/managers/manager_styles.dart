import 'package:flutter/material.dart';
import 'package:tasks/core/managers/manager_strings.dart';
import '../../../core/managers/manager_colors.dart';
import '../../../core/managers/manager_font_family.dart';
import 'manager_font_size.dart';

class ManagerStyles {
  static const TextStyle bigTitle = TextStyle(
    color: ManagerColors.primary,
    fontFamily: ManagerFontFamily.almarai,
    fontSize: ManagerFontSize.larger,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle title = TextStyle(
    color: ManagerColors.primary,
    fontFamily: ManagerFontFamily.almarai,
    fontSize: ManagerFontSize.large,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle regularText = TextStyle(
    color: Colors.white,
    fontFamily: ManagerFontFamily.almarai,
    fontSize: ManagerFontSize.medium,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle subTitle = TextStyle(
    color: ManagerColors.grey,
    fontFamily: ManagerFontFamily.almarai,
    fontSize: ManagerFontSize.medium,
    fontWeight: FontWeight.w400,
  );

  static InputDecoration textFormFieldDecoration({required String hintText}) {
    return InputDecoration(
      contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),

      hintText: hintText,

      hintStyle: const TextStyle(
        fontFamily: ManagerFontFamily.almarai,
        color: Color(0XFFACB5BB),
        fontSize: 16,
      ),

      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Color(0xFFEDF1F3)),
        borderRadius: BorderRadius.circular(10),
      ),

      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: ManagerColors.primary, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),

      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.red, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.red, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
