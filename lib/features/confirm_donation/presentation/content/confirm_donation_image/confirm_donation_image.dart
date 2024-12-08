import 'package:app_ui/app_constants/colors_constant.dart';
import 'package:app_ui/app_image/app_image.dart';
import 'package:flutter/material.dart';
import 'package:proyectos_amor/features/confirm_donation/confirm_donation_images.dart';

class ConfirmDonationImage extends StatelessWidget {
  const ConfirmDonationImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      width: MediaQuery.of(context).size.width,
      child: const Stack(
        children: <Widget>[
          Positioned(
            left: 120,
            top: 24,
            child: SizedBox(
              height: 16,
              width: 16,
              child: Center(
                child: AppImage.assetSvg(
                  asset: ConfirmDonationImages.confirmDonationStarIcon,
                  fit: BoxFit.cover,
                  color: ColorsConstant.secondaryColor,
                ),
              ),
            ),
          ),
          Positioned(
            right: 124,
            top: 40,
            child: SizedBox(
              height: 16,
              width: 16,
              child: Center(
                child: AppImage.assetSvg(
                  asset: ConfirmDonationImages.confirmDonationStarIcon,
                  fit: BoxFit.cover,
                  color: ColorsConstant.splashButtonPrimaryFontColor,
                ),
              ),
            ),
          ),
          Positioned(
            left: 48,
            top: 164,
            child: SizedBox(
              height: 16,
              width: 16,
              child: Center(
                child: AppImage.assetSvg(
                  asset: ConfirmDonationImages.confirmDonationStarIcon,
                  fit: BoxFit.cover,
                  color: ColorsConstant.splashSecondaryFontColor,
                ),
              ),
            ),
          ),
          Positioned(
            right: 164,
            top: 196,
            child: SizedBox(
              height: 16,
              width: 16,
              child: Center(
                child: AppImage.assetSvg(
                  asset: ConfirmDonationImages.confirmDonationStarIcon,
                  fit: BoxFit.cover,
                  color: ColorsConstant.splashButtonPrimaryFontColor,
                ),
              ),
            ),
          ),
          Center(
            child: AppImage.assetSvg(
              asset: ConfirmDonationImages.confirmDonationPeople,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
