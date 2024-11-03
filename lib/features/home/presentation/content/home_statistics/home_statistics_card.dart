import 'package:app_ui/app_button/app_button.dart';
import 'package:app_ui/app_constants/colors_constant.dart';
import 'package:app_ui/app_constants/size_constants.dart';
import 'package:app_ui/app_image/app_image.dart';
import 'package:app_ui/app_text/app_text.dart';
import 'package:flutter/material.dart';
import 'package:proyectos_amor/features/home/home_images.dart';
import 'package:proyectos_amor/features/home/home_strings.dart';

class HomeStatisticsCard extends StatelessWidget {
  const HomeStatisticsCard({super.key});

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
              asset: HomeImages.homeStatisticsPlaceholder,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(SizeConstants.lg),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const AppText.bold(
                    'Estamos en todo el Perú',
                    fontColor: ColorsConstant.text950,
                    fontSize: 18,
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: SizeConstants.sm),
                  const AppText.semiBold(
                    '11 provincias',
                    fontColor: ColorsConstant.text950,
                    fontSize: 14,
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: SizeConstants.xs),
                  const AppText.normal(
                    'visitadas',
                    fontColor: ColorsConstant.text600,
                    fontSize: 12,
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: SizeConstants.sm),
                  const AppText.semiBold(
                    '109 sueños cumplidos',
                    fontColor: ColorsConstant.text950,
                    fontSize: 14,
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: SizeConstants.xs),
                  const AppText.normal(
                    'de niños con cáncer',
                    fontColor: ColorsConstant.text600,
                    fontSize: 12,
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: SizeConstants.sm),
                  const AppText.semiBold(
                    '14K beneficiados',
                    fontColor: ColorsConstant.text600,
                    fontSize: 14,
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: SizeConstants.xs),
                  const AppText.normal(
                    'en todo el Perú',
                    fontColor: ColorsConstant.text600,
                    fontSize: 12,
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: SizeConstants.lg),
                  AppButton.solid(
                    text: HomeStrings.homeStatisticsCardPrimaryButton,
                    onTap: () {},
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
