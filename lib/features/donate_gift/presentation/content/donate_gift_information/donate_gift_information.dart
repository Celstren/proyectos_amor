import 'package:app_ui/app_text_field/app_labeled_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyectos_amor/features/donate_gift/donate_gift_strings.dart';
import 'package:proyectos_amor/features/donate_gift/logic/cubit/donate_gift_step_cubit/donate_gift_step_cubit.dart';

class DonateGiftInformation extends StatelessWidget {
  const DonateGiftInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        context.read<DonateGiftStepCubit>().change(DonateGiftStep.giftType);
      },
      child: const Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          AppLabeledTextField(
            label: DonateGiftStrings.donateGiftInformationLabel1,
            hint: DonateGiftStrings.donateGiftInformationHint1,
          ),
          SizedBox(height: 24),
          AppLabeledTextField(
            label: DonateGiftStrings.donateGiftInformationLabel2,
            hint: DonateGiftStrings.donateGiftInformationHint2,
          ),
        ],
      ),
    );
  }
}
