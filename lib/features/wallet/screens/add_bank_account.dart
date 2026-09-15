import 'package:flutter/material.dart';
import 'package:tasks/core/managers/manager_strings.dart';
import 'package:tasks/features/authentication/widgets/login_button.dart';
import 'package:tasks/features/wallet/managers/wallet_font_size_manager.dart';
import 'package:tasks/features/wallet/managers/wallet_manager_styles.dart';
import 'package:tasks/features/wallet/widgets/add_account_form_field.dart';
import 'package:tasks/features/wallet/widgets/confirm_dialog.dart';
import 'package:tasks/features/wallet/widgets/top_part.dart';

class AddBankAccount extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey();
  AddBankAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            children: [
              TopPart(
                title: ManagerStrings.addBankAccountScreenTitle,
                subTitle: ManagerStrings.addBankAccountScreenSubTitle,
              ),

              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                  child: Column(
                    spacing: 20,
                    children: [
                      Column(
                        spacing: 5,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ManagerStrings.addBankAccount,
                            style: WalletManagerStyles.blackLabel.copyWith(
                              fontSize: WalletFontSizeManager.larg,
                            ),
                          ),
                          Text(
                            ManagerStrings.enterYourBankAccountInfo,
                            style: WalletManagerStyles.greyLabel,
                          ),
                        ],
                      ),

                      Form(
                        key: formKey,
                        child: Column(
                          spacing: 15,
                          children: [
                            AddAccountFormField(
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return "يرجى إدخال اسم المصرف";
                                }

                                if (value.trim().length < 2) {
                                  return "اسم المصرف غير صحيح";
                                }

                                return null;
                              },
                              label: ManagerStrings.bankName,
                              hintText: ManagerStrings.bankNameHint,
                            ),

                            AddAccountFormField(
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return "يرجى إدخال اسم صاحب الحساب";
                                }

                                if (value.trim().length < 3) {
                                  return "يرجى إدخال الاسم كاملًا";
                                }

                                return null;
                              },
                              label: ManagerStrings.bankAccountOwnerName,
                              hintText: ManagerStrings.bankAccountOwnerNameHint,
                            ),

                            AddAccountFormField(
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return "يرجى إدخال رقم الحساب";
                                }

                                if (!RegExp(r'^\d+$').hasMatch(value.trim())) {
                                  return "رقم الحساب يجب أن يحتوي على أرقام فقط";
                                }

                                if (value.trim().length < 6) {
                                  return "يرجى إدخال رقم الحساب كاملًا";
                                }

                                return null;
                              },
                              label: ManagerStrings.bankAccountNumber,
                              hintText: ManagerStrings.bankAccountNumberHint,
                            ),

                            AddAccountFormField(
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return "يرجى إدخال رقم الآيبان";
                                }

                                final iban = value
                                    .replaceAll(' ', '')
                                    .toUpperCase();

                                if (!RegExp(r'^SA\d{22}$').hasMatch(iban)) {
                                  return "رقم الآيبان غير صحيح";
                                }

                                return null;
                              },
                              label: ManagerStrings.bankAccountIBANNumber,
                              hintText:
                                  ManagerStrings.bankAccountIBANNumberHint,
                            ),

                            LoginButton(
                              textButton: ManagerStrings.addAccount,
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  showDialog(
                                    context: context,
                                    barrierColor: Colors.transparent,
                                    builder: (context) {
                                      return ConfirmDialog(
                                        title: ManagerStrings
                                            .addAccountDialogTitle,
                                        subTitle: ManagerStrings
                                            .addAccountDialogSubTitle,
                                      );
                                    },
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
