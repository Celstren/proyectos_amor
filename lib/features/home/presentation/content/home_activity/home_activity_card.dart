import 'package:app_ui/app_button/app_button.dart';
import 'package:app_ui/app_constants/colors_constant.dart';
import 'package:app_ui/app_constants/size_constants.dart';
import 'package:app_ui/app_image/app_image.dart';
import 'package:app_ui/app_progress_bar/app_progress_bar.dart';
import 'package:app_ui/app_text/app_text.dart';
import 'package:flutter/material.dart';
import 'package:proyectos_amor/config/app_constants.dart';
import 'package:proyectos_amor/features/home/home_images.dart';
import 'package:proyectos_amor/features/home/home_strings.dart';

class HomeActivityCard extends StatelessWidget {
  const HomeActivityCard({super.key});

  @override
  Widget build(BuildContext context) {
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
                  const AppText.semiBold(
                    'Sanar Jugando',
                    fontColor: ColorsConstant.text950,
                    fontSize: 16,
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: SizeConstants.sm),
                  const AppText.normal(
                    'Queremos trasladar a 30 niños de provincia a Lima para que se puedan arender mejor',
                    fontColor: ColorsConstant.text950,
                    fontSize: 12,
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: SizeConstants.lg),
                  const AppProgressBar(
                    color: Color(0xFF4E46B4),
                    percentage: .5,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        AppText.semiBold(
                          '${AppConstants.appCurrency} 600.00',
                          fontColor: ColorsConstant.text950,
                          fontSize: 12,
                          textAlign: TextAlign.start,
                        ),
                        AppText.normal(
                          '${AppConstants.appCurrency} 1,200.00',
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
                    onTap: () {},
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
