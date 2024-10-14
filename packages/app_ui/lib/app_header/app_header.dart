import 'package:app_ui/app_constants/colors_constant.dart';
import 'package:app_ui/app_image/app_icon.dart';
import 'package:app_ui/app_text/app_text.dart';
import 'package:flutter/material.dart';

class AppHeader extends StatelessWidget {
  final String title;
  final Color? titleColor;
  final Color? iconColor;
  final Color? iconBackgroundColor;
  final VoidCallback? onLeadingTap;
  final VoidCallback? onActionTap;
  final Widget? action;
  const AppHeader({
    super.key,
    required this.onLeadingTap,
    this.onActionTap,
    this.title = '',
    this.titleColor,
    this.iconColor,
    this.iconBackgroundColor,
    this.action,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 26),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: ColorsConstant.neutralWhite.withOpacity(.05),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          onLeadingTap != null ?
          GestureDetector(
            onTap: onLeadingTap,
            behavior: HitTestBehavior.opaque,
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: iconBackgroundColor ?? ColorsConstant.neutralWhite.withOpacity(.1),
              ),
              child: AppIcon.chevronLeftIcon(
                size: 20,
                color: iconColor ?? ColorsConstant.neutralWhite,
              ),
            ),
          ) : const SizedBox(
            height: 44,
            width: 44,
          ),
          Expanded(
            child: AppText.medium(
              title,
              fontSize: 16,
              fontColor: titleColor ?? ColorsConstant.neutralWhite,
              textAlign: TextAlign.center,
            ),
          ),
          action != null ?
          GestureDetector(
            onTap: onActionTap,
            behavior: HitTestBehavior.opaque,
            child: action,
          ) : const SizedBox(
            height: 36,
            width: 36,
          ),
        ],
      ),
    );
  }
}
