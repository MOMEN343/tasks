import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tasks/core/managers/manager_colors.dart';
import 'package:tasks/features/wallet/managers/wallet_manager_image.dart';

class RyalImage extends StatelessWidget {
  int size;
  Color color;
  RyalImage({super.key, this.size = 12,  this.color = ManagerColors.secondary});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      WalletManagerImage.ryal,

      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
      height: size.toDouble(),
    );
  }
}
