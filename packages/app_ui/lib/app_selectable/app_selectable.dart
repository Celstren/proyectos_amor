import 'package:app_ui/app_constants/colors_constant.dart';
import 'package:app_ui/app_image/app_icon.dart';
import 'package:app_ui/app_image/app_rounded_icon.dart';
import 'package:app_ui/app_text/app_text.dart';
import 'package:flutter/material.dart';

class AppSelectable extends StatelessWidget {
  final String label;
  final Widget icon;
  final bool selected;
  final VoidCallback onTap;

  const AppSelectable({
    super.key,
    this.label = '',
    required this.icon,
    this.selected = false,
    required this.onTap,
});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            AppRoundedIcon(icon: icon, background: ColorsConstant.skyBlue050),
            const SizedBox(width: 16),
            Expanded(
              child: AppText.medium(
                label,
                fontColor: ColorsConstant.skyBlue950,
                fontSize: 14,
                textAlign: TextAlign.start,
              ),
            ),
            const SizedBox(width: 16),
            selected ? Container(
              height: 24,
              width: 24,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: ColorsConstant.feedbackSuccess600,
              ),
              child: const Center(
                child: AppIcon.checkIcon(
                  color: ColorsConstant.neutralWhite,
                  size: 9,
                ),
              ),
            ) : Container(
              height: 24,
              width: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: ColorsConstant.text200, width: 2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
