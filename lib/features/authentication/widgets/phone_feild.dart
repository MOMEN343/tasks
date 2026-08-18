import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:tasks/core/managers/manager_colors.dart';
import 'package:tasks/core/managers/manager_styles.dart';

class Phonefeild extends StatelessWidget {
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
            dropdownDecoration: BoxDecoration(
              border: Border(
                right: BorderSide(color: Color(0xFFEDF1F3), width: 1.5),
              ),
            ),

            decoration: InputDecoration(
              hintText: '  رقم الهاتف',
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
              print(phone.completeNumber);
            },
          ),
        ],
      ),
    );
  }
}
