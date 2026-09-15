import 'package:flutter/material.dart';
import 'package:tasks/core/managers/manager_colors.dart';
import 'package:tasks/core/managers/manager_strings.dart';
import 'package:tasks/features/wallet/managers/wallet_font_size_manager.dart';

class TopPart extends StatelessWidget {
  final String title;
  final String subTitle;
  final double height;
  final bool trailing;
  final void Function()? trailingFunc;
  const TopPart({
    super.key,
    required this.title,
    required this.subTitle,
    this.height = 78,
    this.trailing = false,
    this.trailingFunc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      color: ManagerColors.primary,
      child: Align(
        alignment: Alignment.topRight,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SizedBox(
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  spacing: 5,
                  children: [
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.5),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 22,
                        ),
                      ),
                    ),
                    Column(
                      spacing: 3,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: WalletFontSizeManager.larger,
                          ),
                        ),
                        Text(
                          subTitle,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: WalletFontSizeManager.small,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                if (trailing)
                  InkWell(
                    onTap: trailingFunc,
                    child: Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: ManagerColors.secondary,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        Icons.info_outline,
                        color: Colors.white,
                        size: 20,
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
