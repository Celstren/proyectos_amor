import 'package:app_ui/app_constants/fonts_constant.dart';
import 'package:flutter/material.dart';

class AppRichText extends StatelessWidget {
  final String primaryText;
  final FontWeight? primaryFontWeight;
  final double primaryFontSize;
  final Color? primaryFontColor;
  final String secondaryText;
  final FontWeight? secondaryFontWeight;
  final double secondaryFontSize;
  final Color? secondaryFontColor;
  final String ternaryText;
  final FontWeight? ternaryFontWeight;
  final double ternaryFontSize;
  final Color? ternaryFontColor;
  final TextAlign? textAlign;
  final FontStyle? fontStyle;
  final TextDecoration? decoration;
  final int? maxLines;
  final double? lineHeight;

  const AppRichText({
    super.key,
    this.primaryText = '',
    this.primaryFontWeight = FontWeight.w700,
    this.primaryFontSize = 14,
    this.primaryFontColor,
    this.secondaryText = '',
    this.secondaryFontWeight = FontWeight.w700,
    this.secondaryFontSize = 14,
    this.secondaryFontColor,
    this.ternaryText = '',
    this.ternaryFontWeight = FontWeight.w700,
    this.ternaryFontSize = 14,
    this.ternaryFontColor,
    this.textAlign,
    this.fontStyle,
    this.decoration,
    this.maxLines,
    this.lineHeight,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: textAlign ?? TextAlign.start,
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
            text: primaryText,
            style: TextStyle(
              fontWeight: primaryFontWeight,
              color: primaryFontColor,
              fontSize: primaryFontSize,
              fontStyle: fontStyle,
              decoration: decoration,
              height: lineHeight,
              overflow: TextOverflow.clip,
              fontFamily: FontsConstant.montserrat,
              package: 'app_ui',
            ),
          ),
          TextSpan(
            text: secondaryText,
            style: TextStyle(
              fontWeight: secondaryFontWeight,
              color: secondaryFontColor,
              fontSize: secondaryFontSize,
              fontStyle: fontStyle,
              decoration: decoration,
              height: lineHeight,
              overflow: TextOverflow.clip,
              fontFamily: FontsConstant.montserrat,
              package: 'app_ui',
            ),
          ),
          TextSpan(
            text: ternaryText,
            style: TextStyle(
              fontWeight: ternaryFontWeight,
              color: ternaryFontColor,
              fontSize: ternaryFontSize,
              fontStyle: fontStyle,
              decoration: decoration,
              height: lineHeight,
              overflow: TextOverflow.clip,
              fontFamily: FontsConstant.montserrat,
              package: 'app_ui',
            ),
          ),
        ],
      ),
    );
  }
}