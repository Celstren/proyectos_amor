import 'package:app_ui/app_constants/colors_constant.dart';
import 'package:app_ui/app_text/app_rich_text.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyectos_amor/features/donate_gift/donate_gift_strings.dart';
import 'package:proyectos_amor/features/donate_gift/logic/cubit/donate_gift_step_cubit/donate_gift_step_cubit.dart';

class DonateGiftHeader extends StatelessWidget {
  final DonateGiftStepCubit donateGiftStepCubit;
  const DonateGiftHeader({super.key, required this.donateGiftStepCubit});

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
                bloc: donateGiftStepCubit,
                builder: (context, DonateGiftStep stepState) => AppRichText(
                  primaryText: DonateGiftStrings.donateGiftHeaderStep1.replaceAll('{step}','${stepState.index + 1}'),
                  primaryFontColor: ColorsConstant.splashPrimaryFontColor,
                  primaryFontWeight: FontWeight.bold,
                  primaryFontSize: 12,
                  secondaryText: DonateGiftStrings.donateGiftHeaderStep2.replaceAll('{total}', '${DonateGiftStep.values.length}'),
                  secondaryFontColor: ColorsConstant.splashPrimaryFontColor,
                  secondaryFontWeight: FontWeight.w400,
                  secondaryFontSize: 12,
                ),
              ),
              const SizedBox(height: 8),
              BlocBuilder(
                bloc: donateGiftStepCubit,
                builder: (context, DonateGiftStep stepState) {
                  switch(stepState) {
                    case DonateGiftStep.giftType:
                      return const AppRichText(
                        primaryText: DonateGiftStrings.donateGiftHeader11,
                        primaryFontColor: ColorsConstant.splashPrimaryFontColor,
                        primaryFontWeight: FontWeight.bold,
                        primaryFontSize: 18,
                        secondaryText: DonateGiftStrings.donateGiftHeader12,
                        secondaryFontColor: ColorsConstant.primaryColor,
                        secondaryFontWeight: FontWeight.bold,
                        secondaryFontSize: 18,
                        ternaryText: DonateGiftStrings.donateGiftHeader13,
                        ternaryFontColor: ColorsConstant.splashPrimaryFontColor,
                        ternaryFontWeight: FontWeight.bold,
                        ternaryFontSize: 18,
                      );
                    case DonateGiftStep.information:
                    return const AppRichText(
                      primaryText: DonateGiftStrings.donateGiftHeader21,
                      primaryFontColor: ColorsConstant.splashPrimaryFontColor,
                      primaryFontWeight: FontWeight.bold,
                      primaryFontSize: 18,
                      secondaryText: DonateGiftStrings.donateGiftHeader22,
                      secondaryFontColor: ColorsConstant.primaryColor,
                      secondaryFontWeight: FontWeight.bold,
                      secondaryFontSize: 18,
                    );
                    case DonateGiftStep.locations:
                      return const AppRichText(
                        primaryText: DonateGiftStrings.donateGiftHeader31,
                        primaryFontColor: ColorsConstant.splashPrimaryFontColor,
                        primaryFontWeight: FontWeight.bold,
                        primaryFontSize: 18,
                        secondaryText: DonateGiftStrings.donateGiftHeader32,
                        secondaryFontColor: ColorsConstant.primaryColor,
                        secondaryFontWeight: FontWeight.bold,
                        secondaryFontSize: 18,
                        ternaryText: DonateGiftStrings.donateGiftHeader33,
                        ternaryFontColor: ColorsConstant.splashPrimaryFontColor,
                        ternaryFontWeight: FontWeight.bold,
                        ternaryFontSize: 18,
                      );
                    case DonateGiftStep.deliveryDate:
                      return const AppRichText(
                        primaryText: DonateGiftStrings.donateGiftHeader41,
                        primaryFontColor: ColorsConstant.splashPrimaryFontColor,
                        primaryFontWeight: FontWeight.bold,
                        primaryFontSize: 18,
                        secondaryText: DonateGiftStrings.donateGiftHeader42,
                        secondaryFontColor: ColorsConstant.primaryColor,
                        secondaryFontWeight: FontWeight.bold,
                        secondaryFontSize: 18,
                        ternaryText: DonateGiftStrings.donateGiftHeader43,
                        ternaryFontColor: ColorsConstant.splashPrimaryFontColor,
                        ternaryFontWeight: FontWeight.bold,
                        ternaryFontSize: 18,
                      );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
