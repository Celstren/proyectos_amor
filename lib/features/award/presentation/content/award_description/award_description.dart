import 'package:app_ui/app_constants/colors_constant.dart';
import 'package:app_ui/app_constants/size_constants.dart';
import 'package:app_ui/app_text/app_text.dart';
import 'package:flutter/material.dart';
import 'package:proyectos_amor/features/award/award_strings.dart';

class AwardDescription extends StatelessWidget {
  const AwardDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        AppText.semiBold(
          AwardStrings.awardDescriptionTitle,
          fontSize: 16,
          fontColor: ColorsConstant.text950,
          textAlign: TextAlign.start,
        ),
        SizedBox(height: SizeConstants.md),
        AppText.normal(
          AwardStrings.awardDescriptionSubTitle,
          fontSize: 12,
          fontColor: ColorsConstant.text600,
          textAlign: TextAlign.start,
        ),
      ],
    );
  }
}
