import 'package:app_ui/app_constants/colors_constant.dart';
import 'package:app_ui/app_text/app_text.dart';
import 'package:flutter/material.dart';
import 'package:proyectos_amor/features/confirm_donation/confirm_donation_strings.dart';

class ConfirmDonationDescription extends StatelessWidget {
  const ConfirmDonationDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const AppText.bold(
              ConfirmDonationStrings.confirmDonationDescriptionTitle,
              fontSize: 14,
              fontColor: ColorsConstant.splashPrimaryFontColor,
              textAlign: TextAlign.center,
            ),
            const SizedBox(width: 12),
            Container(
              height: 24,
              width: 24,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: ColorsConstant.primaryColor,
              ),
              child: const Center(
                child: Icon(
                  Icons.check,
                  color: ColorsConstant.neutralWhite,
                  size: 16,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const AppText.normal(
          ConfirmDonationStrings.confirmDonationDescriptionSubTitle,
          fontSize: 12,
          fontColor: ColorsConstant.splashPrimaryFontColor,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 24),
        const Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            AppText.normal(
              ConfirmDonationStrings.confirmDonationDescriptionDonationLabel,
              fontSize: 12,
              fontColor: ColorsConstant.textPlaceholder,
              textAlign: TextAlign.center,
            ),
            AppText.normal(
              'S/ 100.00',
              fontSize: 12,
              fontColor: ColorsConstant.splashPrimaryFontColor,
              textAlign: TextAlign.center,
            ),
          ],
        ),
        const SizedBox(height: 24),
        const Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            AppText.normal(
              ConfirmDonationStrings.confirmDonationDescriptionApprovedLabel,
              fontSize: 12,
              fontColor: ColorsConstant.textPlaceholder,
              textAlign: TextAlign.center,
            ),
            AppText.normal(
              '24 Abril 2024',
              fontSize: 12,
              fontColor: ColorsConstant.splashPrimaryFontColor,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ],
    );
  }
}
