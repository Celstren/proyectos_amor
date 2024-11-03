import 'package:app_ui/app_constants/colors_constant.dart';
import 'package:app_ui/app_constants/size_constants.dart';
import 'package:app_ui/app_image/app_image.dart';
import 'package:app_ui/app_text/app_text.dart';
import 'package:flutter/material.dart';
import 'package:proyectos_amor/features/profile/profile_images.dart';
import 'package:proyectos_amor/features/profile/profile_strings.dart';

class UnauthorizedSharing extends StatelessWidget {
  const UnauthorizedSharing({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(SizeConstants.xl),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const AppText.semiBold(
            ProfileStrings.unauthorizedSharingTitle,
            fontSize: 14,
            fontColor: ColorsConstant.text950,
          ),
          const SizedBox(height: SizeConstants.xl),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: 120,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 52,
                      width: 52,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(SizeConstants.lg),
                        color: ColorsConstant.text050,
                      ),
                      child: const Center(
                        child: AppImage.assetSvg(
                          asset: ProfileImages.profileStarIcon,
                          size: 24,
                        ),
                      ),
                    ),
                    const SizedBox(height: SizeConstants.sm),
                    const AppText.semiBold(
                      ProfileStrings.unauthorizedSharingOption1,
                      fontSize: 12,
                      fontColor: ColorsConstant.text600,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: SizeConstants.xl),
              SizedBox(
                width: 120,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 52,
                      width: 52,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(SizeConstants.lg),
                        color: ColorsConstant.text050,
                      ),
                      child: const Center(
                        child: AppImage.assetSvg(
                          asset: ProfileImages.profileHearthIcon,
                          size: 24,
                        ),
                      ),
                    ),
                    const SizedBox(height: SizeConstants.sm),
                    const AppText.semiBold(
                      ProfileStrings.unauthorizedSharingOption2,
                      fontSize: 12,
                      fontColor: ColorsConstant.text600,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
