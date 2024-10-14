import 'package:app_ui/app_text/app_animated_text.dart';
import 'package:flutter/material.dart';

class AppAnimatedButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final bool loading;
  final double fontSize;
  final Color color;
  final Color? fontColor;
  final Color? disabledColor;
  final Color? disabledFontColor;
  final double radius;
  final FontWeight fontWeight;
  final EdgeInsets padding;

  const AppAnimatedButton({
    super.key,
    this.text = '',
    this.onTap,
    this.loading = false,
    this.fontSize = 16,
    this.color = Colors.black,
    this.fontColor,
    this.disabledColor,
    this.disabledFontColor,
    this.radius = 8,
    this.fontWeight = FontWeight.w600,
    this.padding = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        padding: padding,
        decoration: BoxDecoration(
          color: onTap != null ? color : disabledColor,
          borderRadius: BorderRadius.all(Radius.circular(radius)),
        ),
        duration: const Duration(milliseconds: 500),
        child: AppAnimatedText.semiBold(
          text,
          textAlign: TextAlign.center,
          fontSize: fontSize,
          fontWeight: fontWeight,
          fontColor: onTap != null
              ? (fontColor ?? Colors.white)
              : (disabledFontColor ?? Colors.black12),
          maxLines: null,
        ),
      ),
    );
  }
}