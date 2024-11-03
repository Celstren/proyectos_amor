import 'package:app_ui/app_constants/colors_constant.dart';
import 'package:app_ui/app_constants/size_constants.dart';
import 'package:app_ui/app_image/app_image.dart';
import 'package:app_ui/app_text/app_text.dart';
import 'package:flutter/material.dart';
import 'package:proyectos_amor/features/home/home_images.dart';

class HomeUserToken extends StatelessWidget {
  const HomeUserToken({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        AppImage.assetSvg(
          asset: HomeImages.homeHeaderHearth,
          height: 24,
          width: 24,
        ),
        SizedBox(width: SizeConstants.sm),
        AppText.semiBold(
          '-',
          fontSize: 16,
          fontColor: ColorsConstant.text950,
          textAlign: TextAlign.start,
        ),
      ],
    );
  }
}
