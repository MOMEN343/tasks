import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pinput/pinput.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:tasks/core/managers/manager_colors.dart';
import 'package:tasks/core/managers/manager_strings.dart';

import 'package:tasks/features/authentication/managers/manager_font_size.dart';
import 'package:tasks/features/authentication/managers/manager_styles.dart';
import 'package:tasks/features/authentication/screens/new_password_screen.dart';
import 'package:tasks/core/widgets/login_button.dart';
import 'package:tasks/features/authentication/utils/auth_error_helper.dart';
import 'package:tasks/features/authentication/utils/phone_utils.dart';

class VerificationScreen extends StatefulWidget {
  final String phoneNumber;

  const VerificationScreen({super.key, required this.phoneNumber});

  @override
  State<VerificationScreen> createState() => _VerificationScreen();
}

class _VerificationScreen extends State<VerificationScreen> {
  String otpCode = '';
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: Directionality(
            textDirection: TextDirection.rtl,
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  child: Opacity(
                    opacity: 0.5,
                    child: SvgPicture.asset("assets/images/back.svg"),
                  ),
                ),

                SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsetsGeometry.symmetric(horizontal: 24),
                    child: Padding(
                      padding: EdgeInsets.only(top: 130),
                      child: SizedBox(
                        width: double.infinity,
                        child: Column(
                          children: [
                            Column(
                              spacing: 10,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  ManagerStrings.enterVerificationCode,
                                  style: ManagerStyles.title,
                                ),

                                Text(
                                  ManagerStrings.verificationMessage(
                                    maskPhoneNumber(widget.phoneNumber),
                                  ),
                                  style: ManagerStyles.subTitle.copyWith(
                                    fontSize: ManagerFontSize.medium,
                                    height: 1.6,
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.only(top: 80),
                                  child: Column(
                                    spacing: 20,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            ManagerStrings.verificationCode,
                                            style: ManagerStyles.title.copyWith(
                                              fontSize: ManagerFontSize.medium,
                                            ),
                                          ),

                                          TextButton(
                                            onPressed: () {},
                                            child: Text(
                                              ManagerStrings.resendCode,
                                              style: ManagerStyles.subTitle
                                                  .copyWith(
                                                    fontSize:
                                                        ManagerFontSize.medium,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),

                                      Pinput(
                                        length: 6,
                                        keyboardType: TextInputType.number,
                                        onCompleted: (value) {
                                          otpCode = value;
                                        },
                                        focusedPinTheme: PinTheme(
                                          width: 49,
                                          height: 56,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: ManagerColors.primary,
                                              width: 1.5,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                          ),
                                        ),
                                        defaultPinTheme: PinTheme(
                                          width: 49,
                                          height: 56,
                                          decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            border: Border.all(
                                              color: ManagerColors.lightGrey,
                                              width: 1,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                          ),
                                        ),
                                      ),

                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            ManagerStrings.resetCodeSentIn,
                                            style: ManagerStyles.subTitle,
                                          ),

                                          Text(
                                            "03:05",
                                            style: ManagerStyles.subTitle,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),

                                Padding(
                                  padding: EdgeInsetsGeometry.only(
                                    top: 74,
                                    bottom: 10,
                                  ),
                                  child: LoginButton(
                                    textButton: ManagerStrings.next,
                                    isLoading: isLoading,
                                    onPressed: () async {
                                      if (isLoading) return;
                                      if (otpCode.length != 6) {
                                        return;
                                      }
                                      try {
                                        setState(() {
                                          isLoading = true;
                                        });
                                        await Supabase.instance.client.auth
                                            .verifyOTP(
                                              phone: widget.phoneNumber,
                                              token: otpCode,
                                              type: OtpType.sms,
                                            );
                                        if (!mounted) return;
                                        Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                NewPasswordScreen(),
                                          ),
                                        );
                                      } on AuthException catch (e) {
                                        if (!mounted) return;
                                        showAuthError(context, e);
                                        debugPrint(e.code);
                                      } finally {
                                        if (mounted) {
                                          setState(() {
                                            isLoading = false;
                                          });
                                        }
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
