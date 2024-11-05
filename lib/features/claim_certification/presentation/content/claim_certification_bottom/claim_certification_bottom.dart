import 'package:app_ui/app_constants/colors_constant.dart';
import 'package:app_ui/app_constants/size_constants.dart';
import 'package:app_ui/app_text/app_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:proyectos_amor/features/claim_certification/claim_certification_strings.dart';

class ClaimCertificationBottom extends StatelessWidget {
  const ClaimCertificationBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: SizeConstants.xl),
      padding: const EdgeInsets.all(SizeConstants.xl),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(SizeConstants.md),
        border: Border.all(color: ColorsConstant.text100),
      ),
      child: const AppRichText(
        primaryText: ClaimCertificationStrings.claimCertificationBottomText1,
        primaryFontColor: ColorsConstant.text950,
        primaryFontSize: 12,
        primaryFontWeight: FontWeight.w400,
        secondaryText: ' ${ClaimCertificationStrings.claimCertificationBottomText2}',
        secondaryFontColor: ColorsConstant.text950,
        secondaryFontSize: 12,
        secondaryFontWeight: FontWeight.w700,
      ),
    );
  }
}
