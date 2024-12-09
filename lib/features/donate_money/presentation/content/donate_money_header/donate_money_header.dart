import 'package:app_ui/app_constants/colors_constant.dart';
import 'package:app_ui/app_text/app_rich_text.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyectos_amor/features/donate_money/donate_money_strings.dart';
import 'package:proyectos_amor/features/donate_money/logic/cubit/donate_money_step_cubit/donate_money_step_cubit.dart';

class DonateMoneyHeader extends StatelessWidget {
  final DonateMoneyStepCubit donateMoneyStepCubit;
  const DonateMoneyHeader({super.key, required this.donateMoneyStepCubit});

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
              BlocBuilder(
                bloc: donateMoneyStepCubit,
                builder: (context, DonateMoneyStep stepState) => AppRichText(
                  primaryText: DonateMoneyStrings.donateMoneyContentStepHeader1.replaceAll('{step}','${stepState.index + 1}'),
                  primaryFontColor: ColorsConstant.splashPrimaryFontColor,
                  primaryFontWeight: FontWeight.bold,
                  primaryFontSize: 12,
                  secondaryText: DonateMoneyStrings.donateMoneyContentStepHeader2.replaceAll('{total}', '${DonateMoneyStep.values.length}'),
                  secondaryFontColor: ColorsConstant.splashPrimaryFontColor,
                  secondaryFontWeight: FontWeight.w400,
                  secondaryFontSize: 12,
                ),
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
