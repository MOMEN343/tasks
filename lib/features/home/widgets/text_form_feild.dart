import 'package:flutter/material.dart';
import 'package:tasks/core/managers/manager_colors.dart';
import 'package:tasks/features/home/managers/manages_text_styles.dart';

class TextFormFeildStyle extends StatelessWidget {
  final String hintText;
  final String? Function(String?)? validator;

  final double hight;
  final double width;

  final int? maxLines;
  final Widget? suffixIcon;

  const TextFormFeildStyle({
    super.key,
    required this.hintText,
    required this.validator,
    required this.width,
    this.hight = 44,
    this.maxLines = 1,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: hight,
      child: TextFormField(
        validator: validator,
        maxLines: maxLines,
        decoration: InputDecoration(
          hintText: hintText,
          suffixIcon: suffixIcon,
          hintStyle: ManagerTextStyles.hintText,

          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),

          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ManagerColors.lightGrey, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),

          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ManagerColors.primary),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
