import 'package:flutter/material.dart';
import 'package:tasks/features/wallet/managers/wallet_manager_styles.dart';

class AddAccountFormField extends StatelessWidget {
  final String label;
  final String hintText;
  final String? Function(String?)? validator;

  const AddAccountFormField({
    super.key,
    required this.label,
    required this.hintText,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 5,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: WalletManagerStyles.blackLabel),
        TextFormField(
          validator: validator,
          decoration: WalletManagerStyles.formFieldDecoration(
            hintText: hintText,
          ),
        ),
      ],
    );
  }
}
