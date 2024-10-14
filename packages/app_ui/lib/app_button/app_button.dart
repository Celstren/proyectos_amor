import 'package:app_ui/app_constants/colors_constant.dart';
import 'package:app_ui/app_constants/size_constants.dart';
import 'package:app_ui/app_text/app_text.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final double fontSize;
  final Color color;
  final Color hoveredColor;
  final Color pressedColor;
  final Color? fontColor;
  final Color? disabledColor;
  final Color? disabledFontColor;
  final double radius;
  final EdgeInsets padding;

  const AppButton({
    super.key,
    this.text = '',
    this.onTap,
    this.fontSize = 16,
    this.color = ColorsConstant.skyBlue600,
    this.hoveredColor = ColorsConstant.skyBlue700,
    this.pressedColor = ColorsConstant.skyBlue800,
    this.fontColor = ColorsConstant.neutralWhite,
    this.disabledColor = ColorsConstant.text050,
    this.disabledFontColor = ColorsConstant.text300,
    this.radius = 8,
    this.padding = const EdgeInsets.all(SizeConstants.md),
  });

  const AppButton.solid({
    super.key,
    this.text = '',
    this.onTap,
    this.fontSize = 16,
    this.color = ColorsConstant.skyBlue600,
    this.hoveredColor = ColorsConstant.skyBlue700,
    this.pressedColor = ColorsConstant.skyBlue800,
    this.fontColor = ColorsConstant.neutralWhite,
    this.disabledColor = ColorsConstant.text050,
    this.disabledFontColor = ColorsConstant.text300,
    this.radius = 8,
    this.padding = const EdgeInsets.all(SizeConstants.md),
  });

  const AppButton.ghost({
    super.key,
    this.text = '',
    this.onTap,
    this.fontSize = 16,
    this.color = ColorsConstant.skyBlue050,
    this.hoveredColor = ColorsConstant.skyBlue100,
    this.pressedColor = ColorsConstant.skyBlue300,
    this.fontColor = ColorsConstant.skyBlue600,
    this.disabledColor = ColorsConstant.text050,
    this.disabledFontColor = ColorsConstant.text300,
    this.radius = 8,
    this.padding = const EdgeInsets.all(SizeConstants.md),
  });

  const AppButton.link({
    super.key,
    this.text = '',
    this.onTap,
    this.fontSize = 16,
    this.color = Colors.transparent,
    this.hoveredColor = Colors.transparent,
    this.pressedColor = Colors.transparent,
    this.fontColor = ColorsConstant.skyBlue600,
    this.disabledColor = Colors.transparent,
    this.disabledFontColor = ColorsConstant.text300,
    this.radius = 8,
    this.padding = const EdgeInsets.all(SizeConstants.md),
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        foregroundColor: onTap != null ? Colors.white : Colors.grey,
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(radius),
          ),
        ),
      ).copyWith(
        backgroundColor: WidgetStateProperty.resolveWith<Color>(
          (states) {
            if (states.contains(WidgetState.disabled)) {
              return disabledColor ?? ColorsConstant.text050;
            }
            if (states.contains(WidgetState.hovered)) {
              return hoveredColor;
            }
            if (states.contains(WidgetState.pressed)) {
              return pressedColor;
            }
            return color;
          },
        ),
      ),
      child: Padding(
        padding: padding,
        child: AppText.semiBold(
          text,
          textAlign: TextAlign.center,
          fontSize: fontSize,
          fontColor: onTap != null
              ? (fontColor ?? Colors.white)
              : (disabledFontColor ?? Colors.black12),
          maxLines: null,
        ),
      ),
    );
  }
}
