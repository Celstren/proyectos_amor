import 'package:app_ui/app_button/app_button.dart';
import 'package:app_ui/app_constants/colors_constant.dart';
import 'package:app_ui/app_constants/size_constants.dart';
import 'package:app_ui/app_text/app_text.dart';
import 'package:flutter/material.dart';
import 'package:proyectos_amor/features/claim_certification/claim_certification_strings.dart';

class ClaimCertificationDescription extends StatelessWidget {
  const ClaimCertificationDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: SizeConstants.xl),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const AppText.bold(
            ClaimCertificationStrings.claimCertificationDescriptionTitle,
            fontSize: 24,
            fontColor: ColorsConstant.text950,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: SizeConstants.sm),
          const AppText.medium(
            ClaimCertificationStrings.claimCertificationDescriptionSubTitle,
            fontSize: 16,
            fontColor: ColorsConstant.text950,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 56),
          Center(
            child: AppButton.solid(
              onTap: () {},
              padding: const EdgeInsets.symmetric(vertical: SizeConstants.sm, horizontal: 48),
              text: ClaimCertificationStrings.claimCertificationDescriptionPrimaryButton,
            ),
          ),
        ],
      ),
    );
  }
}
