import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart' as intl;
import 'package:tasks/core/managers/manager_colors.dart';
import 'package:tasks/core/managers/manager_strings.dart';
import 'package:tasks/features/authentication/widgets/login_button.dart';
import 'package:tasks/features/home/data/user_data.dart';
import 'package:tasks/features/wallet/data/balance.dart';
import 'package:tasks/features/wallet/managers/wallet_font_size_manager.dart';
import 'package:tasks/features/wallet/managers/wallet_manager_styles.dart';
import 'package:tasks/features/wallet/widgets/confirm_dialog.dart';
import 'package:tasks/features/wallet/widgets/ryal_image.dart';
import 'package:tasks/features/wallet/widgets/top_part.dart';

class NewWithdrawalScreen extends StatelessWidget {
  final formatter = intl.NumberFormat('#,###');
  final double maxLimit = 22000;
  final GlobalKey<FormState> formKey = GlobalKey();

  NewWithdrawalScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            TopPart(
              title: ManagerStrings.newWithdrawalScreenTitle,
              subTitle: ManagerStrings.newWithdrawalScreenSubTitle,
              trailing: true,
            ),

            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                child: Column(
                  spacing: 10,
                  children: [
                    //title and subTitle
                    Row(
                      spacing: 5,
                      children: [
                        InkWell(
                          child: Container(
                            padding: EdgeInsets.all(9),
                            width: 42,
                            height: 42,
                            decoration: BoxDecoration(
                              color: ManagerColors.secondary,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: SvgPicture.asset(
                              "assets/images/solar_card-broken.svg",
                            ),
                          ),
                        ),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              ManagerStrings.newWithdrawalRequest,
                              style: TextStyle(
                                fontSize: WalletFontSizeManager.larg,
                                fontWeight: FontWeight(400),
                              ),
                            ),
                            Text(
                              ManagerStrings.newWithdrawalRequestSubTitle,
                              style: WalletManagerStyles.greysmallLabel,
                            ),
                          ],
                        ),
                      ],
                    ),

                    //amount and notes feilds
                    Form(
                      key: formKey,
                      child: Column(
                        spacing: 10,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 5,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(ManagerStrings.requiredAmount),
                                  Row(
                                    spacing: 5,
                                    children: [
                                      Text(
                                        formatter.format(
                                          wallet.withdrawableBalance,
                                        ),
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      RyalImage(size: 12),
                                    ],
                                  ),
                                ],
                              ),

                              TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "لا يمكن أن يكون الحقل فارغ";
                                  }

                                  final amount = int.tryParse(value);

                                  if (amount == null) {
                                    return "يرجى إدخال رقم صحيح";
                                  }

                                  if (amount > maxLimit) {
                                    return "لقد تجاوزت الحد الأقصى";
                                  }

                                  return null;
                                },
                                initialValue: "0",

                                decoration:
                                    WalletManagerStyles.FormFieldDecoration(),
                              ),

                              Row(
                                spacing: 3,
                                children: [
                                  Text(
                                    "${ManagerStrings.maximumLimit} ${formatter.format(maxLimit)}",
                                    style: TextStyle(
                                      fontSize: WalletFontSizeManager.smaller,
                                      color: ManagerColors.grey,
                                    ),
                                  ),
                                  RyalImage(size: 8, color: ManagerColors.grey),
                                ],
                              ),
                            ],
                          ),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 5,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [Text(ManagerStrings.notes)],
                              ),

                              TextFormField(
                                validator: (value) {
                                  if (value!.trim().length > 300) {
                                    return "الملاحظات يجب ألا تتجاوز 300 حرف";
                                  }

                                  return null;
                                },
                                maxLines: 5,
                                decoration:
                                    WalletManagerStyles.FormFieldDecoration(
                                      hintText:
                                          ManagerStrings.notesFieldHintText,
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          ManagerStrings.bankAccount,
                          style: WalletManagerStyles.blackLabel,
                        ),

                        Container(
                          padding: EdgeInsets.all(10),
                          height: 43,
                          decoration: BoxDecoration(
                            color: ManagerColors.blue.withValues(alpha: 0.04),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                spacing: 3,
                                children: [
                                  Text(user.bankName!),

                                  Text(maskBankAccount(user.bankAccount!)),
                                ],
                              ),

                              InkWell(
                                onTap: () {},
                                child: Text(
                                  ManagerStrings.changeBankAccount,
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    LoginButton(
                      textButton: ManagerStrings.confirmWithdrawal,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          showDialog(
                            context: context,
                            barrierColor: Colors.transparent,
                            builder: (context) {
                              return ConfirmDialog(
                                title:
                                    ManagerStrings.confirmWithdrawalDialogTitle,
                                subTitle: ManagerStrings
                                    .confirmWithdrawalDialogsubTitle,
                              );
                            },
                          );
                        }
                      },
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 3,
                      children: [
                        Icon(
                          Icons.access_time_sharp,
                          color: ManagerColors.grey,
                          size: 10,
                        ),
                        Text(
                          ManagerStrings.willtransferIn,
                          style: TextStyle(
                            color: ManagerColors.grey,
                            fontSize: WalletFontSizeManager.smaller,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String maskBankAccount(String account) {
  if (account.length <= 4) {
    return account;
  }

  return "${account.substring(0, 2)}** **** ***${account.substring(account.length - 4)}";
}
