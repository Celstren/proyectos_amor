import 'package:app_ui/app_button/app_button.dart';
import 'package:app_ui/app_constants/colors_constant.dart';
import 'package:app_ui/app_image/app_icon.dart';
import 'package:app_ui/app_text/app_text.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:proyectos_amor/features/profile/profile_strings.dart';
import 'package:proyectos_amor/router/app_router.gr.dart';

class AuthenticatedDonationEmpty extends StatelessWidget {
  const AuthenticatedDonationEmpty({super.key});

  void _showDonationOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (bottomSheetContext) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: const Icon(Icons.volunteer_activism_outlined),
                  title: const Text(
                    ProfileStrings.authenticatedDonationEmptyMoneyOption,
                  ),
                  onTap: () {
                    Navigator.of(bottomSheetContext).pop();
                    AutoRouter.of(context).push(const DonateMoneyPageRoute());
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.card_giftcard_outlined),
                  title: const Text(
                    ProfileStrings.authenticatedDonationEmptyGiftOption,
                  ),
                  onTap: () {
                    Navigator.of(bottomSheetContext).pop();
                    AutoRouter.of(context).push(const DonateGiftPageRoute());
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: ColorsConstant.secondaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 64,
              width: 64,
              decoration: const BoxDecoration(
                color: ColorsConstant.neutralWhite,
                shape: BoxShape.circle,
              ),
              child: const Center(
                child: AppIcon.hearthFilledIcon(
                  size: 32,
                  color: ColorsConstant.primaryColor600,
                ),
              ),
            ),
            const SizedBox(height: 16),
            const AppText.semiBold(
              ProfileStrings.authenticatedDonationEmptyTitle,
              fontColor: ColorsConstant.text950,
              fontSize: 18,
              textAlign: TextAlign.center,
              maxLines: 3,
            ),
            const SizedBox(height: 8),
            const AppText.normal(
              ProfileStrings.authenticatedDonationEmptyDescription,
              fontColor: ColorsConstant.text700,
              fontSize: 14,
              textAlign: TextAlign.center,
              maxLines: 4,
            ),
            const SizedBox(height: 18),
            SizedBox(
              width: double.infinity,
              child: AppButton.solid(
                text: ProfileStrings.authenticatedDonationEmptyButton,
                radius: 56,
                onTap: () => _showDonationOptions(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
