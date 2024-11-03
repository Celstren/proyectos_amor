import 'package:app_ui/app_constants/colors_constant.dart';
import 'package:app_ui/app_constants/size_constants.dart';
import 'package:app_ui/app_text/app_text.dart';
import 'package:flutter/material.dart';
import 'package:proyectos_amor/features/home/home_strings.dart';
import 'package:proyectos_amor/features/home/presentation/content/home_how_help/home_gift_help/home_gift_help.dart';
import 'package:proyectos_amor/features/home/presentation/content/home_how_help/home_money_help/home_money_help.dart';

class HomeHowHelp extends StatelessWidget {
  const HomeHowHelp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        AppText.semiBold(
          HomeStrings.homeHowHelpTitle,
          fontSize: 18,
          fontColor: ColorsConstant.text950,
          textAlign: TextAlign.start,
        ),
        SizedBox(height: SizeConstants.lg),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              HomeMoneyHelp(),
              SizedBox(width: SizeConstants.xl),
              HomeGiftHelp(),
            ],
          ),
        ),
      ],
    );
  }
}
