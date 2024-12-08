import 'package:app_ui/app_constants/colors_constant.dart';
import 'package:app_ui/app_text/app_rich_text.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:proyectos_amor/features/donate_money/donate_money_strings.dart';

class DonateMoneyHeader extends StatelessWidget {
  const DonateMoneyHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: ColorsConstant.secondaryColor,
      child: SizedBox(
        child: Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).viewPadding.top,
            left: 18,
            right: 18,
            bottom: 32,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: AutoRouter.of(context).maybePop,
                    behavior: HitTestBehavior.opaque,
                    child: const Icon(
                      Icons.arrow_back,
                      size: 24,
                    ),
                  ),
                ),
              ),
              const AppRichText(
                primaryText: DonateMoneyStrings.donateMoneyContentStepHeader1,
                primaryFontColor: ColorsConstant.splashPrimaryFontColor,
                primaryFontWeight: FontWeight.bold,
                primaryFontSize: 12,
                secondaryText: DonateMoneyStrings.donateMoneyContentStepHeader2,
                secondaryFontColor: ColorsConstant.splashPrimaryFontColor,
                secondaryFontWeight: FontWeight.w400,
                secondaryFontSize: 12,
              ),
              const SizedBox(height: 8),
              const AppRichText(
                primaryText: DonateMoneyStrings.donateMoneyContentHeader1,
                primaryFontColor: ColorsConstant.splashPrimaryFontColor,
                primaryFontWeight: FontWeight.bold,
                primaryFontSize: 18,
                secondaryText: DonateMoneyStrings.donateMoneyContentHeader2,
                secondaryFontColor: ColorsConstant.primaryColor,
                secondaryFontWeight: FontWeight.bold,
                secondaryFontSize: 18,
                ternaryText: DonateMoneyStrings.donateMoneyContentHeader3,
                ternaryFontColor: ColorsConstant.splashPrimaryFontColor,
                ternaryFontWeight: FontWeight.bold,
                ternaryFontSize: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
