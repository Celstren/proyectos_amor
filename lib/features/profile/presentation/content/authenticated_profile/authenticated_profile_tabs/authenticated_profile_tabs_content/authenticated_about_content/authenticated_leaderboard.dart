import 'package:app_ui/app_constants/colors_constant.dart';
import 'package:app_ui/app_drop_down/app_drop_down.dart';
import 'package:app_ui/app_text/app_text.dart';
import 'package:flutter/material.dart';
import 'package:proyectos_amor/features/profile/profile_strings.dart';

class AuthenticatedLeaderboard extends StatelessWidget {
  const AuthenticatedLeaderboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        const AppText.semiBold(
          ProfileStrings.authenticatedAboutContentLeaderboard,
          fontColor: ColorsConstant.textPlaceholder,
          fontSize: 14,
          textAlign: TextAlign.start,
        ),
        const SizedBox(height: 12),
        AppDropDown(
          options: <AppDropDownOption>[
            AppDropDownOption(id: 1, value: 'Enero'),
            AppDropDownOption(id: 2, value: 'Febrero'),
            AppDropDownOption(id: 3, value: 'Marzo'),
            AppDropDownOption(id: 4, value: 'Abril'),
            AppDropDownOption(id: 5, value: 'Mayo'),
            AppDropDownOption(id: 6, value: 'Junio'),
            AppDropDownOption(id: 7, value: 'Julio'),
            AppDropDownOption(id: 8, value: 'Agosto'),
            AppDropDownOption(id: 9, value: 'Septiembre'),
            AppDropDownOption(id: 10, value: 'Octubre'),
            AppDropDownOption(id: 11, value: 'Noviembre'),
            AppDropDownOption(id: 12, value: 'Diciembre'),
          ],
          onChanged: (p0) {},
          hint: ProfileStrings.authenticatedAboutContentLeaderboardHint,
        ),
        const SizedBox(height: 24),
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: ColorsConstant.text100,
              ),
              child: const AppText.semiBold(
                '#14',
                fontSize: 14,
                fontColor: ColorsConstant.splashPrimaryFontColor,
                textAlign: TextAlign.start,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: ColorsConstant.textPlaceholder),
                color: ColorsConstant.neutralWhite,
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  AppText.semiBold(
                    '#15',
                    fontSize: 14,
                    fontColor: ColorsConstant.textLink,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(width: 12),
                  AppText.semiBold(
                    'Juan Jose Torre',
                    fontSize: 14,
                    fontColor: ColorsConstant.splashPrimaryFontColor,
                    textAlign: TextAlign.start,
                  ),
                  Spacer(),
                  AppText.semiBold(
                    '123 pts',
                    fontSize: 14,
                    fontColor: ColorsConstant.textPlaceholder,
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: ColorsConstant.text100,
              ),
              child: const AppText.semiBold(
                '#16',
                fontSize: 14,
                fontColor: ColorsConstant.splashPrimaryFontColor,
                textAlign: TextAlign.start,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
