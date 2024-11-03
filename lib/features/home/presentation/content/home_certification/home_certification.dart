import 'package:app_ui/app_constants/colors_constant.dart';
import 'package:app_ui/app_constants/size_constants.dart';
import 'package:app_ui/app_image/app_image.dart';
import 'package:app_ui/app_text/app_text.dart';
import 'package:flutter/material.dart';
import 'package:proyectos_amor/features/home/home_images.dart';
import 'package:proyectos_amor/features/home/home_strings.dart';

class HomeCertification extends StatelessWidget {
  const HomeCertification({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 112,
      decoration: BoxDecoration(
        color: const Color(0xFFBFA3C4),
        borderRadius: BorderRadius.circular(SizeConstants.lg),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(SizeConstants.lg),
              child: const Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  AppText.normal(
                    HomeStrings.homeCertificationDescription,
                    fontSize: 12,
                    fontColor: ColorsConstant.text950,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: SizeConstants.xs),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      AppText.semiBold(
                        HomeStrings.homeCertificationCheckCertification,
                        fontSize: 12,
                        fontColor: ColorsConstant.text950,
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(width: SizeConstants.sm),
                      Icon(
                        Icons.arrow_forward,
                        size: 16,
                        color: ColorsConstant.text950,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: EdgeInsets.only(right: 24),
              child: AppImage.assetSvg(
                height: 98,
                asset: HomeImages.homeCertificationIcon,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
