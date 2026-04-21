import 'package:app_ui/app_text_field/app_labeled_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyectos_amor/features/donate_gift/donate_gift_strings.dart';
import 'package:proyectos_amor/features/donate_gift/logic/cubit/donate_gift_step_cubit/donate_gift_step_cubit.dart';

class DonateGiftInformation extends StatelessWidget {
  final TextEditingController productController;
  final TextEditingController quantityController;

  const DonateGiftInformation({
    super.key,
    required this.productController,
    required this.quantityController,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        context.read<DonateGiftStepCubit>().change(DonateGiftStep.giftType);
      },
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          AppLabeledTextField(
            controller: productController,
            label: DonateGiftStrings.donateGiftInformationLabel1,
            hint: DonateGiftStrings.donateGiftInformationHint1,
          ),
          const SizedBox(height: 24),
          AppLabeledTextField(
            controller: quantityController,
            label: DonateGiftStrings.donateGiftInformationLabel2,
            hint: DonateGiftStrings.donateGiftInformationHint2,
          ),
        ],
      ),
    );
  }
}
