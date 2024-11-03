import 'package:app_ui/app_constants/colors_constant.dart';
import 'package:app_ui/app_constants/size_constants.dart';
import 'package:app_ui/app_image/app_image.dart';
import 'package:app_ui/app_text/app_text.dart';
import 'package:flutter/material.dart';
import 'package:proyectos_amor/features/home/home_images.dart';
import 'package:proyectos_amor/features/home/home_strings.dart';

class HomeMoneyHelp extends StatelessWidget {
  const HomeMoneyHelp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 166,
      height: 142,
      decoration: BoxDecoration(
        color: const Color(0xFFBFA3C4),
        borderRadius: BorderRadius.circular(SizeConstants.lg),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(SizeConstants.lg),
        child: Stack(
          children: <Widget>[
            const Positioned(
              bottom: 0,
              right: 0,
              child: SizedBox(
                height: 86,
                width: 132,
                child: Center(
                  child: AppImage.assetSvg(
                    asset: HomeImages.homeHelpMoneyBg,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: SizeConstants.md),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Center(
                    child: AppImage.assetSvg(
                      asset: HomeImages.homeHelpMoney,
                      height: 44,
                      width: 74,
                    ),
                  ),
                  const SizedBox(height: SizeConstants.md),
                  const AppText.semiBold(
                    HomeStrings.homeMoneyHelpTitle,
                    fontSize: 12,
                    fontColor: ColorsConstant.text950,
                  ),
                  const SizedBox(height: SizeConstants.xs),
                  AppText.normal(
                    HomeStrings.homeMoneyHelpSubTitle,
                    fontSize: 10,
                    fontColor: ColorsConstant.text950,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
