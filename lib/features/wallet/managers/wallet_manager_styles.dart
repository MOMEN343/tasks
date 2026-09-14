import 'package:flutter/material.dart';
import 'package:tasks/core/managers/manager_colors.dart';
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
}
