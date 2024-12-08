import 'package:app_ui/app_constants/colors_constant.dart';
import 'package:app_ui/app_text/app_text.dart';
import 'package:flutter/material.dart';
import 'package:proyectos_amor/features/donate_money/donate_money_strings.dart';

class DonateCopyItem extends StatelessWidget {
  final String label;
  final String text;

  const DonateCopyItem({super.key, this.label = '', this.text = ''});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: ColorsConstant.sliderSecondaryColor,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                AppText.normal(
                  label,
                  fontSize: 12,
                  fontColor: ColorsConstant.textPlaceholder,
                ),
                const SizedBox(height: 4),
                AppText.medium(
                  text,
                  fontSize: 14,
                  fontColor: ColorsConstant.splashPrimaryFontColor,
                ),
              ],
            ),
          ),
          const AppText.bold(
            DonateMoneyStrings.donateCopyItemButton,
            fontSize: 14,
            fontColor: ColorsConstant.textLink,
          ),
        ],
      ),
    );
  }
}
