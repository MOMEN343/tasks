import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:tasks/core/managers/manager_colors.dart';
import 'package:tasks/core/managers/manager_font_family.dart';
import 'package:tasks/features/authentication/managers/manager_styles.dart';

class PhoneField extends StatelessWidget {
  final ValueChanged<String> onChanged;

  const PhoneField({super.key, required this.onChanged});
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        spacing: 5,
        children: [
          Text("رقم الهاتف", style: ManagerStyles.subTitle),
          IntlPhoneField(
            disableLengthCheck: true,
            autovalidateMode: AutovalidateMode.onUnfocus,
            validator: (p0) {
              if (p0!.number.isEmpty) {
                return "هذا الحقل مطلوب";
              } else if ((p0.number.length) > 10) {
                return "لا يمكن أن يكون رقم الهاتف أكبر من 10 أرقام";
              }
            },
            dropdownDecoration: BoxDecoration(
              border: Border(
                right: BorderSide(color: Color(0xFFEDF1F3), width: 1.5),
              ),
            ),

            decoration: InputDecoration(
              hint: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'رقم الهاتف',
                  style: TextStyle(
                    fontFamily: ManagerFontFamily.almarai,
                    color: Color(0XFFACB5BB),
                    fontSize: 16,
                  ),
                ),
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
            initialCountryCode: 'PS',
            onChanged: (phone) {
              onChanged(phone.completeNumber);
            },
          ),
        ],
      ),
    );
  }
}
