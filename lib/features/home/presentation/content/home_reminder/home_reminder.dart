import 'package:app_ui/app_constants/colors_constant.dart';
import 'package:app_ui/app_constants/size_constants.dart';
import 'package:app_ui/app_image/app_image.dart';
import 'package:app_ui/app_text/app_text.dart';
import 'package:flutter/material.dart';
import 'package:proyectos_amor/features/home/home_images.dart';

class HomeReminder extends StatelessWidget {
  final String title;
  final String subTitle;
  final Color? background;
  const HomeReminder({super.key, this.title = '', this.subTitle = '', this.background});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 112,
      decoration: BoxDecoration(
        color: background ?? const Color(0xFFBFA3C4),
        borderRadius: BorderRadius.circular(SizeConstants.lg),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.only(right: 24),
              child: AppImage.assetSvg(
                height: 98,
                asset: HomeImages.homeReminderIcon,
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(SizeConstants.lg),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  AppText.semiBold(
                    title,
                    fontSize: 12,
                    fontColor: ColorsConstant.text950,
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: SizeConstants.xs),
                  AppText.normal(
                    subTitle,
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
