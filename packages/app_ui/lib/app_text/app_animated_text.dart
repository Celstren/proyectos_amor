import 'package:app_ui/app_constants/fonts_constant.dart';
import 'package:flutter/material.dart';

class AppAnimatedText extends StatelessWidget {
  final String text;
  final FontWeight? fontWeight;
  final double fontSize;
  final Color? fontColor;
  final TextAlign? textAlign;
  final FontStyle? fontStyle;
  final TextDecoration? decoration;
  final int? maxLines;
  final double? letterSpacing;
  final bool softWrap;
  final TextOverflow? overFlow;

  const AppAnimatedText.light(
      this.text, {
        super.key,
        this.fontWeight = FontWeight.w300,
        this.fontSize = 12,
        this.fontColor,
        this.textAlign,
        this.fontStyle,
        this.decoration,
        this.maxLines,
        this.letterSpacing,
        this.softWrap = true,
        this.overFlow,
      });

  const AppAnimatedText.normal(
      this.text, {
        super.key,
        this.fontWeight = FontWeight.w400,
        this.fontSize = 12,
        this.fontColor,
        this.textAlign,
        this.fontStyle,
        this.decoration,
        this.maxLines,
        this.letterSpacing,
        this.softWrap = true,
        this.overFlow,
      });

  const AppAnimatedText.medium(
      this.text, {
        super.key,
        this.fontWeight = FontWeight.w500,
        this.fontSize = 12,
        this.fontColor,
        this.textAlign,
        this.fontStyle,
        this.decoration,
        this.maxLines,
        this.letterSpacing,
        this.softWrap = true,
        this.overFlow,
      });

  const AppAnimatedText.semiBold(
      this.text, {
        super.key,
        this.fontWeight = FontWeight.w600,
        this.fontSize = 12,
        this.fontColor,
        this.textAlign,
        this.fontStyle,
        this.decoration,
        this.maxLines,
        this.letterSpacing,
        this.softWrap = true,
        this.overFlow,
      });

  const AppAnimatedText.bold(
      this.text, {
        super.key,
        this.fontWeight = FontWeight.w700,
        this.fontSize = 12,
        this.fontColor,
        this.textAlign,
        this.fontStyle,
        this.decoration,
        this.maxLines,
        this.letterSpacing,
        this.softWrap = true,
        this.overFlow,
      });

  @override
  Widget build(BuildContext context) {
    return AnimatedDefaultTextStyle(
      style: TextStyle(
        fontWeight: fontWeight,
        color: fontColor,
        fontSize: fontSize,
        fontStyle: fontStyle,
        decoration: decoration,
        overflow: TextOverflow.clip,
        letterSpacing: letterSpacing,
        fontFamily: FontsConstant.montserrat,
        package: 'app_ui',
      ),
      duration: const Duration(milliseconds: 500),
      child: Text(
        text,
        overflow: overFlow,
        softWrap: softWrap,
        textAlign: textAlign,
        maxLines: maxLines,
      ),
    );
  }
}
