import 'package:app_ui/app_constants/colors_constant.dart';
import 'package:app_ui/app_text/app_text.dart';
import 'package:flutter/material.dart';
import 'package:proyectos_amor/features/home/home_strings.dart';

class HomeGreeting extends StatelessWidget {
  const HomeGreeting({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppText.normal(
      HomeStrings.homeGreetingTitle,
      fontSize: 16,
      fontColor: ColorsConstant.text950,
      textAlign: TextAlign.start,
    );
  }
}
