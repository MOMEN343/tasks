import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:tasks/core/managers/manager_strings.dart';

import 'package:tasks/features/authentication/managers/manager_font_size.dart';
import 'package:tasks/features/authentication/managers/manager_styles.dart';
import 'package:tasks/features/authentication/screens/verification_screen.dart';
import 'package:tasks/features/authentication/widgets/login_button.dart';
import 'package:tasks/features/authentication/widgets/phone_feild.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPassword();
}

class _ResetPassword extends State<ResetPassword> {
  String phoneNumber = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Stack(
          children: [
            Positioned(
              top: -10,
              left: 0,
              child: Opacity(
                opacity: 0.5,
                child: SvgPicture.asset("assets/images/back.svg"),
              ),
            ),

            Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                leading: IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),

              body: Directionality(
                textDirection: TextDirection.rtl,
                child: Padding(
                  padding: EdgeInsetsGeometry.symmetric(horizontal: 24),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 75),
                    child: SizedBox(
                      width: double.infinity,
                      child: Column(
                        spacing: 67,
                        children: [
                          Column(
                            spacing: 20,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                ManagerStrings.resetPassword,
                                style: ManagerStyles.title,
                              ),

                              Text(
                                ManagerStrings.resetPasswordDescription,
                                style: ManagerStyles.subTitle.copyWith(
                                  fontSize: ManagerFontSize.medium,
                                  height: 1.6,
                                ),
                              ),
                            ],
                          ),

                          Column(
                            spacing: 10,
                            children: [
                              PhoneField(
                                onChanged: (phone) {
                                  phoneNumber = phone;
                                },
                              ),

                              LoginButton(
                                textButton: ManagerStrings.reset,
                                onPressed: () {
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (context) => VerificationScreen(
                                        phoneNumber: phoneNumber,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
