import 'package:app_ui/app_constants/colors_constant.dart';
import 'package:app_ui/app_image/app_image.dart';
import 'package:app_ui/app_text/app_text.dart';
import 'package:flutter/material.dart';
import 'package:proyectos_amor/features/confirm_donation/confirm_donation_images.dart';

class ConfirmDonationCard extends StatelessWidget {
  const ConfirmDonationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: ColorsConstant.sliderSecondaryColor,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: const Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 100,
              child: AppImage.assetImage(
                asset: ConfirmDonationImages.confirmDonationPlaceholder,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    AppText.bold(
                      '4 familias te lo agradecerán',
                      fontSize: 12,
                      fontColor: ColorsConstant.splashPrimaryFontColor,
                      textAlign: TextAlign.start,
                    ),
                    AppText.normal(
                      'Estarán viajando a Lima para poder atenderse en los hospitales',
                      fontSize: 10,
                      fontColor: ColorsConstant.splashPrimaryFontColor,
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
