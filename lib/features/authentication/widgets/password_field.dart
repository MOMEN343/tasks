import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tasks/core/managers/manager_colors.dart';
import 'package:tasks/core/managers/manager_font_family.dart';

class PasswordField extends StatefulWidget {
  FormFieldValidator<String> validator;

  PasswordField({super.key, required this.validator});

  @override
  State<PasswordField> createState() => _PasswordField();
}

class _PasswordField extends State<PasswordField> {
  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscurePassword,
      validator: widget.validator,
      textAlignVertical: TextAlignVertical.center,

      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),

        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              obscurePassword = !obscurePassword;
            });
          },
          icon: FaIcon(
            obscurePassword ? FontAwesomeIcons.eyeSlash : FontAwesomeIcons.eye,
          ),
          color: Color(0XFFACB5BB),
          iconSize: 15,
        ),
        hintText: 'كلمة المرور',
        hintStyle: TextStyle(
          fontFamily: ManagerFontFamily.almarai,
          color: Color(0XFFACB5BB),
          fontSize: 16,
        ),

        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFFEDF1F3),
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ManagerColors.primary,
            style: BorderStyle.solid,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
