import 'package:app_ui/app_constants/colors_constant.dart';
import 'package:app_ui/app_constants/size_constants.dart';
import 'package:app_ui/app_image/app_image.dart';
import 'package:app_ui/app_text/app_text.dart';
import 'package:flutter/material.dart';
import 'package:proyectos_amor/features/home/home_images.dart';
import 'package:proyectos_amor/features/home/home_strings.dart';

class HomeDonation extends StatelessWidget {
  const HomeDonation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 112,
      decoration: BoxDecoration(
        color: const Color(0xFFF9DE59),
        borderRadius: BorderRadius.circular(SizeConstants.lg),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: EdgeInsets.only(left: 12),
              child: AppImage.assetSvg(
                height: 92,
                asset: HomeImages.homeDonationIcon,
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(SizeConstants.lg),
              child: const Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  AppText.semiBold(
                    HomeStrings.homeDonationTitle,
                    fontSize: 12,
                    fontColor: ColorsConstant.text950,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: SizeConstants.xs),
                  AppText.normal(
                    HomeStrings.homeDonationSubTitle,
                    fontSize: 12,
                    fontColor: ColorsConstant.text950,
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
