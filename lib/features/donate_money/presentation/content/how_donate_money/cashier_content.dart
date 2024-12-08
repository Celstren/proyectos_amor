import 'package:app_ui/app_constants/colors_constant.dart';
import 'package:app_ui/app_text/app_text.dart';
import 'package:flutter/material.dart';
import 'package:proyectos_amor/features/donate_money/donate_money_strings.dart';

class CashierContent extends StatelessWidget {
  const CashierContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: ColorsConstant.sliderSecondaryColor,
            ),
          ),
          child: const Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              AppText.normal(
                DonateMoneyStrings.cashierContentLabel1,
                fontSize: 12,
                fontColor: ColorsConstant.textPlaceholder,
              ),
              SizedBox(height: 8),
              Padding(
                padding: EdgeInsets.only(left: 12),
                child: AppText.bold(
                  DonateMoneyStrings.cashierContentAccounts,
                  fontSize: 12,
                  fontColor: ColorsConstant.textLink,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: ColorsConstant.sliderSecondaryColor,
            ),
          ),
          child: const Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              AppText.normal(
                DonateMoneyStrings.cashierContentLabel2,
                fontSize: 12,
                fontColor: ColorsConstant.textPlaceholder,
              ),
              SizedBox(height: 8),
              Padding(
                padding: EdgeInsets.only(left: 12),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    AppText.medium(
                      'RUC 23434343443',
                      fontSize: 12,
                      fontColor: ColorsConstant.splashPrimaryFontColor,
                    ),
                    AppText.medium(
                      'Proyectos de amor',
                      fontSize: 12,
                      fontColor: ColorsConstant.splashPrimaryFontColor,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
