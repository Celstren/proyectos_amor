import 'package:app_ui/app_constants/colors_constant.dart';
import 'package:app_ui/app_constants/size_constants.dart';
import 'package:app_ui/app_text/app_text.dart';
import 'package:flutter/material.dart';
import 'package:proyectos_amor/features/home/home_strings.dart';
import 'package:proyectos_amor/features/home/presentation/content/home_activity/home_activity_card.dart';

class HomeActivity extends StatelessWidget {
  const HomeActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        const AppText.semiBold(
          HomeStrings.homeActivityTitle,
          fontSize: 18,
          fontColor: ColorsConstant.text950,
          textAlign: TextAlign.start,
        ),
        const SizedBox(height: SizeConstants.lg),
        const HomeActivityCard(),
        const SizedBox(height: SizeConstants.md),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            5,
                (index) => Container(
              width: 8,
              height: 8,
              margin: index != 0 ? const EdgeInsets.only(left: 8) : null,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: 0 == index
                    ? ColorsConstant.sliderPrimaryColor
                    : ColorsConstant.sliderSecondaryColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
