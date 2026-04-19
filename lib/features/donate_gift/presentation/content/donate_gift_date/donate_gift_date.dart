import 'package:app_ui/app_constants/colors_constant.dart';
import 'package:app_ui/app_text/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyectos_amor/features/donate_gift/donate_gift_strings.dart';
import 'package:proyectos_amor/features/donate_gift/logic/cubit/donate_gift_date_cubit/donate_gift_date_cubit.dart';
import 'package:proyectos_amor/features/donate_gift/logic/cubit/donate_gift_step_cubit/donate_gift_step_cubit.dart';
import 'package:proyectos_amor/features/donate_gift/presentation/content/donate_gift_chip_item.dart';
import 'package:proyectos_amor/features/home/presentation/content/home_reminder/home_reminder.dart';

class DonateGiftDate extends StatelessWidget {
  const DonateGiftDate({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        context.read<DonateGiftStepCubit>().change(DonateGiftStep.locations);
      },
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const AppText.normal(
            DonateGiftStrings.donateGiftLocationTitle,
            fontSize: 12,
            fontColor: ColorsConstant.splashPrimaryFontColor,
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: 18),
          BlocBuilder<DonateGiftDateCubit, GiftDate?>(
            builder: (context, GiftDate? dateState) => Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: GiftDate.values
                      .map((e) => DonateGiftChipItem(
                    text: e.text,
                    selected: e == dateState,
                    onTap: () => context.read<DonateGiftDateCubit>().change(e),
                  )).toList(),
                ),
                if (dateState == GiftDate.now)
                  ...[
                    const SizedBox(height: 24),
                    const HomeReminder(
                      title: DonateGiftStrings.donateGiftLocationReminderTitle,
                      subTitle: DonateGiftStrings.donateGiftLocationReminderSubTitle,
                      background: ColorsConstant.secondaryColor,
                    ),
                  ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
