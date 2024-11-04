import 'package:app_ui/app_constants/colors_constant.dart';
import 'package:app_ui/app_constants/size_constants.dart';
import 'package:app_ui/app_text/app_text.dart';
import 'package:flutter/material.dart';
import 'package:proyectos_amor/features/home/home_strings.dart';

class UnauthorizedDonationsContent extends StatelessWidget {
  const UnauthorizedDonationsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        AppText.medium(
          HomeStrings.unauthorizedDonationsContentTitle,
          fontSize: 16,
          fontColor: ColorsConstant.text950,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: SizeConstants.sm),
        AppText.normal(
          HomeStrings.unauthorizedDonationsContentDescription,
          fontSize: 12,
          fontColor: ColorsConstant.text600,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: SizeConstants.xxl),
      ],
    );
  }
}
