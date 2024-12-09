import 'package:app_ui/app_constants/colors_constant.dart';
import 'package:app_ui/app_text/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyectos_amor/features/donate_gift/donate_gift_strings.dart';
import 'package:proyectos_amor/features/donate_gift/logic/cubit/donate_gift_type_cubit/donate_gift_type_cubit.dart';
import 'package:proyectos_amor/features/donate_gift/presentation/content/donate_gift_chip_item.dart';
import 'package:proyectos_amor/features/home/presentation/content/home_reminder/home_reminder.dart';

class DonateGiftType extends StatelessWidget {
  final DonateGiftTypeCubit donateGiftTypeCubit;
  const DonateGiftType({super.key, required this.donateGiftTypeCubit});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        const AppText.normal(
          DonateGiftStrings.donateGiftTypeTitle,
          fontSize: 12,
          fontColor: ColorsConstant.splashPrimaryFontColor,
          textAlign: TextAlign.start,
        ),
        const SizedBox(height: 18),
        BlocBuilder(
          bloc: donateGiftTypeCubit,
          builder: (context, GiftType? typeState) => Wrap(
            spacing: 12,
            runSpacing: 12,
            children: GiftType.values
                .map((e) => DonateGiftChipItem(
              text: e.text,
              selected: e == typeState,
              onTap: () => donateGiftTypeCubit.change(e),
            )).toList(),
          ),
        ),
        const SizedBox(height: 24),
        const HomeReminder(
          title: DonateGiftStrings.donateGiftTypeReminderTitle,
          subTitle: DonateGiftStrings.donateGiftTypeReminderSubTitle,
        ),
      ],
    );
  }
}
