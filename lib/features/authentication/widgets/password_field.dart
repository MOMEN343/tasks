import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tasks/core/managers/manager_colors.dart';
import 'package:tasks/core/managers/manager_font_family.dart';
import 'package:tasks/features/authentication/managers/manager_styles.dart';

class PasswordField extends StatefulWidget {
  final FormFieldValidator<String> validator;
  final TextEditingController controller;
  final String hintText;

  const PasswordField({
    super.key,
    required this.validator,
    required this.controller,
    required this.hintText,
  });

  @override
  State<PasswordField> createState() => _PasswordField();
}

class _PasswordField extends State<PasswordField> {
  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: obscurePassword,
      validator: widget.validator,
      textAlignVertical: TextAlignVertical.center,

      decoration: ManagerStyles.textFormFieldDecoration(
        hintText: widget.hintText,
      ),
    );
  }
}
