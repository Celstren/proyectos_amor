import 'package:app_ui/app_button/app_button.dart';
import 'package:flutter/material.dart';
import 'package:proyectos_amor/features/confirm_donation/confirm_donation_strings.dart';

class ConfirmDonationBottom extends StatelessWidget {
  const ConfirmDonationBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SizedBox(
        height: 48,
        child: AppButton(
          text: ConfirmDonationStrings.confirmDonationDescriptionPrimaryButton,
          radius: 56,
          onTap: () {},
        ),
      ),
    );
  }
}
