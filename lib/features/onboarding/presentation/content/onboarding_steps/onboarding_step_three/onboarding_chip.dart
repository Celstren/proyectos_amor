import 'package:app_ui/app_constants/colors_constant.dart';
import 'package:app_ui/app_constants/size_constants.dart';
import 'package:app_ui/app_text/app_text.dart';
import 'package:flutter/material.dart';

class OnboardingChip extends StatelessWidget {
  final String text;
  final Color color;
  const OnboardingChip.yellow({super.key, this.text = '', this.color = ColorsConstant.secondaryColor});
  const OnboardingChip.black({super.key, this.text = '', this.color = ColorsConstant.neutralBlack});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: SizeConstants.xl),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(56),
      ),
      child: AppText.medium(
        text,
        fontSize: 16,
        fontColor: ColorsConstant.neutralWhite,
        textAlign: TextAlign.center,
      ),
    );
  }
}
