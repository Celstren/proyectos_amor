import 'package:app_ui/app_button/app_button.dart';
import 'package:app_ui/app_constants/colors_constant.dart';
import 'package:app_ui/app_constants/size_constants.dart';
import 'package:app_ui/app_image/app_image.dart';
import 'package:app_ui/app_progress_bar/app_progress_bar.dart';
import 'package:app_ui/app_text/app_text.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:proyectos_amor/config/app_constants.dart';
import 'package:proyectos_amor/features/home/home_images.dart';
import 'package:proyectos_amor/features/home/home_strings.dart';
import 'package:proyectos_amor/router/app_router.gr.dart';
import 'package:proyectos_amor/services/donation_campaign_service/models/donation_campaign_response.dart';

class HomeActivityCard extends StatelessWidget {
  final DonationCampaignResponse? campaign;
  final bool isLoading;

  const HomeActivityCard({
    super.key,
    required this.campaign,
    this.isLoading = false,
  });

  const HomeActivityCard.loading({super.key})
      : campaign = null,
        isLoading = true;

  @override
  Widget build(BuildContext context) {
    final donationCampaign = campaign;
    final isMoneyCampaign = donationCampaign?.isMoneyCampaign ?? true;
    final progress = donationCampaign?.progress ?? .5;
    final currentValue = donationCampaign == null
        ? '${AppConstants.appCurrency} 600.00'
        : isMoneyCampaign
            ? _formatMoney(donationCampaign.currentAmount)
            : '${donationCampaign.currentQuantity} ${HomeStrings.homeActivityDonatedSuffix}';
    final goalValue = donationCampaign == null
        ? '${AppConstants.appCurrency} 1,200.00'
        : isMoneyCampaign
            ? _formatMoney(donationCampaign.goalAmount ?? '0')
            : '${donationCampaign.goalQuantity ?? 0} ${HomeStrings.homeActivityGoalSuffix}';

    return Container(
      decoration: BoxDecoration(
        color: ColorsConstant.neutralWhite,
        border: Border.all(color: ColorsConstant.text100),
        borderRadius: BorderRadius.circular(SizeConstants.lg),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(SizeConstants.lg),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            if (donationCampaign?.imageUrl?.isNotEmpty == true)
              AppImage.network(
                height: 182,
                width: MediaQuery.of(context).size.width,
                asset: donationCampaign!.imageUrl!,
                fit: BoxFit.cover,
                errorAsset: HomeImages.homeActivityPlaceholder,
              )
            else
              AppImage.assetImage(
                height: 182,
                width: MediaQuery.of(context).size.width,
                asset: HomeImages.homeActivityPlaceholder,
                fit: BoxFit.cover,
              ),
            Padding(
              padding: const EdgeInsets.all(SizeConstants.lg),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  AppText.semiBold(
                    donationCampaign?.title ??
                        HomeStrings.homeActivityFallbackTitle,
                    fontColor: ColorsConstant.text950,
                    fontSize: 16,
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    overFlow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: SizeConstants.sm),
                  AppText.normal(
                    donationCampaign?.description ??
                        HomeStrings.homeActivityFallbackDescription,
                    fontColor: ColorsConstant.text950,
                    fontSize: 12,
                    textAlign: TextAlign.start,
                    maxLines: 2,
                    overFlow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: SizeConstants.lg),
                  AppProgressBar(
                    color: isMoneyCampaign
                        ? const Color(0xFF4E46B4)
                        : ColorsConstant.skyBlue950,
                    percentage: progress,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        AppText.semiBold(
                          currentValue,
                          fontColor: ColorsConstant.text950,
                          fontSize: 12,
                          textAlign: TextAlign.start,
                        ),
                        AppText.normal(
                          goalValue,
                          fontColor: ColorsConstant.text950,
                          fontSize: 12,
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: SizeConstants.lg),
                  AppButton.solid(
                    text: HomeStrings.homeActivityPrimaryButton,
                    radius: 56,
                    onTap: isLoading || donationCampaign == null
                        ? null
                        : () => _goToDonationFlow(context, donationCampaign),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatMoney(String amount) {
    final value = double.tryParse(amount) ?? 0;
    return '${AppConstants.appCurrency} ${value.toStringAsFixed(2)}';
  }

  void _goToDonationFlow(
    BuildContext context,
    DonationCampaignResponse campaign,
  ) {
    if (campaign.isGiftCampaign) {
      AutoRouter.of(context).push(const DonateGiftPageRoute());
      return;
    }

    AutoRouter.of(context).push(const DonateMoneyPageRoute());
  }
}
