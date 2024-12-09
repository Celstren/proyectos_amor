import 'package:app_ui/app_constants/colors_constant.dart';
import 'package:app_ui/app_text/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyectos_amor/features/donate_gift/donate_gift_strings.dart';
import 'package:proyectos_amor/features/donate_gift/logic/cubit/donate_gift_location_cubit/donate_gift_location_cubit.dart';
import 'package:proyectos_amor/features/donate_gift/logic/cubit/donate_gift_step_cubit/donate_gift_step_cubit.dart';
import 'package:proyectos_amor/features/donate_gift/presentation/content/donate_gift_chip_item.dart';

class DonateGiftLocation extends StatelessWidget {
  final DonateGiftStepCubit donateGiftStepCubit;
  final DonateGiftLocationCubit donateGiftLocationCubit;
  const DonateGiftLocation({super.key, required this.donateGiftStepCubit, required this.donateGiftLocationCubit});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        donateGiftStepCubit.change(DonateGiftStep.information);
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
          BlocBuilder(
            bloc: donateGiftLocationCubit,
            builder: (context, GiftLocation? locationState) => Wrap(
              spacing: 12,
              runSpacing: 12,
              children: GiftLocation.values
                  .map((e) => DonateGiftChipItem(
                text: e.text,
                selected: e == locationState,
                onTap: () => donateGiftLocationCubit.change(e),
              )).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
