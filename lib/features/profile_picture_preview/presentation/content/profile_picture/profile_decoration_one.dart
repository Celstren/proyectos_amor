import 'package:app_ui/app_constants/colors_constant.dart';
import 'package:app_ui/app_image/app_image.dart';
import 'package:app_ui/app_text/app_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:proyectos_amor/features/profile_picture_preview/profile_picture_preview_images.dart';

class ProfileDecorationOne extends StatelessWidget {
  const ProfileDecorationOne({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        children: <Widget>[
          const AppImage.assetSvg(
            height: 270,
            asset: ProfilePicturePreviewImages.profilePicturePreviewDecoration1,
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: 0,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(width: 56),
                    const Expanded(
                      child: AppRichText(
                        primaryText: 'Yo soy un padrino de',
                        primaryFontColor: ColorsConstant.neutralWhite,
                        primaryFontWeight: FontWeight.normal,
                        primaryFontSize: 16,
                        secondaryText: '\n#Proyectos de amor',
                        secondaryFontColor: ColorsConstant.neutralWhite,
                        secondaryFontWeight: FontWeight.bold,
                        secondaryFontSize: 18,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      height: 56,
                      width: 56,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorsConstant.neutralWhite,
                      ),
                      child: const Center(
                        child: AppImage.assetImage(
                          height: 32,
                          asset: ProfilePicturePreviewImages.profilePicturePreviewCompany,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
