import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:tasks/core/managers/manager_colors.dart';
import 'package:tasks/core/managers/manager_font_family.dart';
import 'package:tasks/core/managers/manager_strings.dart';
import 'package:tasks/features/authentication/managers/manager_styles.dart';

class PhoneField extends FormField<PhoneNumber> {
  PhoneField({
    super.key,
    required FormFieldValidator<PhoneNumber> validator,
    required ValueChanged<String> onChanged,
  }) : super(
         validator: validator,
         builder: (FormFieldState<PhoneNumber> state) {
           return Directionality(
             textDirection: TextDirection.ltr,
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.end,
               spacing: 5,
               children: [
                 Text(
                   ManagerStrings.phoneNumber,
                   style: ManagerStyles.subTitle,
                 ),
                 IntlPhoneField(
                   disableLengthCheck: true,
                   initialCountryCode: 'PS',
                   onChanged: (phone) {
                     state.didChange(phone);
                     onChanged(phone.completeNumber);
                   },
                   decoration: InputDecoration(
                     hint: Align(
                       alignment: Alignment.centerRight,
                       child: Text(
                         ManagerStrings.phoneNumber,
                         style: TextStyle(
                           fontFamily: ManagerFontFamily.almarai,
                           color: Color(0XFFACB5BB),
                           fontSize: 16,
                         ),
                       ),
                     ),
                     enabledBorder: OutlineInputBorder(
                       borderSide: BorderSide(color: Color(0xFFEDF1F3)),
                       borderRadius: BorderRadius.circular(10),
                     ),
                     focusedBorder: OutlineInputBorder(
                       borderSide: BorderSide(
                         color: ManagerColors.primary,
                         width: 1,
                       ),
                       borderRadius: BorderRadius.circular(10),
                     ),
                     errorBorder: OutlineInputBorder(
                       borderSide: BorderSide(color: Colors.red, width: 1),
                       borderRadius: BorderRadius.circular(10),
                     ),
                     focusedErrorBorder: OutlineInputBorder(
                       borderSide: BorderSide(color: Colors.red, width: 2),
                       borderRadius: BorderRadius.circular(10),
                     ),
                     errorText: state.errorText,
                   ),
                 ),
               ],
             ),
           );
         },
       );
}
