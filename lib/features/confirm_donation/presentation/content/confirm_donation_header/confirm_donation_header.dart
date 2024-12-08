import 'package:app_ui/app_constants/colors_constant.dart';
import 'package:app_ui/app_text/app_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:proyectos_amor/features/confirm_donation/confirm_donation_strings.dart';

class ConfirmDonationHeader extends StatelessWidget {
  const ConfirmDonationHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppRichText(
      primaryText: ConfirmDonationStrings.confirmDonationHeader1,
      primaryFontSize: 24,
      primaryFontWeight: FontWeight.bold,
      primaryFontColor: ColorsConstant.splashPrimaryFontColor,
      secondaryText: ConfirmDonationStrings.confirmDonationHeader2,
      secondaryFontSize: 24,
      secondaryFontWeight: FontWeight.bold,
      secondaryFontColor: ColorsConstant.primaryColor700,
      textAlign: TextAlign.start,
    );
  }
}
