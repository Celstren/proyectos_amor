import 'package:app_ui/app_constants/colors_constant.dart';
import 'package:app_ui/app_constants/size_constants.dart';
import 'package:app_ui/app_image/app_image.dart';
import 'package:app_ui/app_text/app_text.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:proyectos_amor/features/home/home_images.dart';
import 'package:proyectos_amor/features/home/home_strings.dart';
import 'package:proyectos_amor/router/app_router.gr.dart';

class HomeGiftHelp extends StatelessWidget {
  const HomeGiftHelp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => AutoRouter.of(context).push(const DonateGiftPageRoute()),
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: 166,
        height: 142,
        decoration: BoxDecoration(
          color: const Color(0xFFF9DE59),
          borderRadius: BorderRadius.circular(SizeConstants.lg),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(SizeConstants.lg),
          child: const Stack(
            children: <Widget>[
              Positioned(
                bottom: 0,
                left: 0,
                child: SizedBox(
                  height: 92,
                  width: 124,
                  child: Center(
                    child: AppImage.assetSvg(
                      asset: HomeImages.homeHelpGiftBg,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: SizeConstants.md),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: SizedBox(
                        height: 54,
                        width: 68,
                        child: Stack(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: AppImage.assetSvg(
                                asset: HomeImages.homeHelpGiftRedBag,
                                height: 53,
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: AppImage.assetSvg(
                                asset: HomeImages.homeHelpGiftGreenBag,
                                height: 40,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: SizeConstants.md),
                    AppText.semiBold(
                      HomeStrings.homeGiftHelpTitle,
                      fontSize: 12,
                      fontColor: ColorsConstant.text950,
                    ),
                    SizedBox(height: SizeConstants.xs),
                    AppText.normal(
                      HomeStrings.homeGiftHelpSubTitle,
                      fontSize: 10,
                      fontColor: ColorsConstant.text950,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
