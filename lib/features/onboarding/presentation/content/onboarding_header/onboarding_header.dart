import 'package:app_ui/app_constants/colors_constant.dart';
import 'package:app_ui/app_image/app_image.dart';
import 'package:app_ui/app_text/app_rich_text.dart';
import 'package:app_ui/app_text/app_text.dart';
import 'package:flutter/material.dart';

class OnboardingHeader extends StatelessWidget {
  final String asset;
  final String title1;
  final String title2;
  final String subTitle;
  const OnboardingHeader({
    super.key,
    this.asset = '',
    this.title1 = '',
    this.title2 = '',
    this.subTitle = '',
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        AppImage.assetSvg(
          height: 192.48,
          width: 113.6,
          asset: asset,
        ),
        const SizedBox(height: 42.52),
        AppRichText(
          primaryText: title1,
          primaryFontColor: ColorsConstant.splashPrimaryFontColor,
          primaryFontSize: 24,
          primaryFontWeight: FontWeight.w700,
          secondaryText: '\n$title2',
          secondaryFontColor: ColorsConstant.splashSecondaryFontColor,
          secondaryFontSize: 24,
          secondaryFontWeight: FontWeight.w700,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 23),
        AppText.normal(
          subTitle,
          fontSize: 14,
          fontColor: ColorsConstant.splashPrimaryFontColor,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
