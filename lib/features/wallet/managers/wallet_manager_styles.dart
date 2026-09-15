import 'package:flutter/material.dart';
import 'package:tasks/core/managers/manager_colors.dart';
import 'package:tasks/core/managers/manager_strings.dart';
import 'package:tasks/features/wallet/managers/wallet_font_size_manager.dart';

class WalletManagerStyles {
  static const TextStyle greyLabel = TextStyle(
    color: ManagerColors.grey,
    fontSize: WalletFontSizeManager.medium,
    fontWeight: FontWeight(400),
  );
  static const TextStyle greysmallLabel = TextStyle(
    color: ManagerColors.grey,
    fontSize: WalletFontSizeManager.small,
    fontWeight: FontWeight(400),
  );
  static const TextStyle blackLabel = TextStyle(
    color: Colors.black,
    fontSize: WalletFontSizeManager.medium,
    fontWeight: FontWeight(400),
  );

  static InputDecoration FormFieldDecoration({String? hintText}) {
    return InputDecoration(
      hintText: ManagerStrings.notesFieldHintText,
      hintStyle: WalletManagerStyles.greyLabel,
      contentPadding: const EdgeInsets.all(12),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: const Color(0xFFD3D3D3).withValues(alpha: 0.5),
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ManagerColors.grey, width: 1),
        borderRadius: BorderRadius.circular(8),
      ),

      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ManagerColors.red, width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ManagerColors.red, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
