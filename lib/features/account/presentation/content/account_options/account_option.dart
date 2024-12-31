import 'package:app_ui/app_constants/colors_constant.dart';
import 'package:app_ui/app_image/app_icon.dart';
import 'package:app_ui/app_text/app_text.dart';
import 'package:flutter/material.dart';

class AccountOption extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const AccountOption({super.key, required this.onTap, this.text = ''});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 18,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: AppText.semiBold(
                text,
                fontSize: 12,
                fontColor: ColorsConstant.textPlaceholder,
              ),
            ),
            Transform.flip(
              flipX: true,
              child: const AppIcon.chevronLeftIcon(
                size: 16,
                color: ColorsConstant.textPlaceholder,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
