import 'package:app_ui/app_constants/colors_constant.dart';
import 'package:app_ui/app_image/app_icon.dart';
import 'package:app_ui/app_text/app_text.dart';
import 'package:flutter/material.dart';

class AppRadioButton extends StatelessWidget {
  final String text;
  final bool selected;
  final VoidCallback onTap;
  final FontWeight fontWeight;
  const AppRadioButton.bold({
    super.key,
    this.selected = false,
    this.text = '',
    this.fontWeight = FontWeight.w700,
    required this.onTap,
  });

  const AppRadioButton.semiBold({
    super.key,
    this.selected = false,
    this.text = '',
    this.fontWeight = FontWeight.w600,
    required this.onTap,
  });

  const AppRadioButton.medium({
    super.key,
    this.selected = false,
    this.text = '',
    this.fontWeight = FontWeight.w500,
    required this.onTap,
  });

  const AppRadioButton.normal({
    super.key,
    this.selected = false,
    this.text = '',
    this.fontWeight = FontWeight.w400,
    required this.onTap,
  });

  const AppRadioButton.light({
    super.key,
    this.selected = false,
    this.text = '',
    this.fontWeight = FontWeight.w300,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          selected
              ? Container(
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
          )
              : Container(
            height: 24,
            width: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border:
              Border.all(color: ColorsConstant.text500),
            ),
          ),
          const SizedBox(width: 6),
          Expanded(
            child: AppText.normal(
              text,
              fontSize: 14,
              fontColor: ColorsConstant.skyBlue950,
              fontWeight: fontWeight,
              maxLines: null,
            ),
          ),
        ],
      ),
    );
  }
}
