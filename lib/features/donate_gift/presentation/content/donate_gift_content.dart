import 'package:app_ui/app_scaffold/app_scaffold.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyectos_amor/features/donate_gift/logic/cubit/donate_gift_step_cubit/donate_gift_step_cubit.dart';
import 'package:proyectos_amor/features/donate_gift/presentation/content/donate_gift_bottom/donate_gift_bottom.dart';
import 'package:proyectos_amor/features/donate_gift/presentation/content/donate_gift_date/donate_gift_date.dart';
import 'package:proyectos_amor/features/donate_gift/presentation/content/donate_gift_header/donate_gift_header.dart';
import 'package:proyectos_amor/features/donate_gift/presentation/content/donate_gift_information/donate_gift_information.dart';
import 'package:proyectos_amor/features/donate_gift/presentation/content/donate_gift_location/donate_gift_location.dart';
import 'package:proyectos_amor/features/donate_gift/presentation/content/donate_gift_type/donate_gift_type.dart';
import 'package:proyectos_amor/router/app_router.gr.dart';

class DonateGiftContent extends StatefulWidget {
  const DonateGiftContent({super.key});

  @override
  State<DonateGiftContent> createState() => _DonateGiftContentState();
}

class _DonateGiftContentState extends State<DonateGiftContent> {

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      safeTop: false,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const DonateGiftHeader(),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: BlocBuilder<DonateGiftStepCubit, DonateGiftStep>(
                builder: (context, DonateGiftStep stepState) {
                  switch(stepState) {
                    case DonateGiftStep.giftType:
                      return const DonateGiftType();
                    case DonateGiftStep.information:
                      return const DonateGiftInformation();
                    case DonateGiftStep.locations:
                      return const DonateGiftLocation();
                    case DonateGiftStep.deliveryDate:
                      return const DonateGiftDate();
                  }
                },
              ),
            ),
          ),
          BlocBuilder<DonateGiftStepCubit, DonateGiftStep>(
            builder: (context, DonateGiftStep stepState) {
              final stepCubit = context.read<DonateGiftStepCubit>();
              switch(stepState) {
                case DonateGiftStep.giftType:
                  return DonateGiftBottom(
                    onNext: () => stepCubit.change(DonateGiftStep.information),
                  );
                case DonateGiftStep.information:
                  return DonateGiftBottom(
                    onNext: () => stepCubit.change(DonateGiftStep.locations),
                  );
                case DonateGiftStep.locations:
                  return DonateGiftBottom(
                    onNext: () => stepCubit.change(DonateGiftStep.deliveryDate),
                  );
                case DonateGiftStep.deliveryDate:
                  return DonateGiftBottom(
                    onDone: () => AutoRouter.of(context).push(ConfirmDonationPageRoute(
                      donation: '3 Muñeca barbie',
                      location: 'San miguel\nAv Emancipación 123',
                      deliveryAt: '¡Ahora mismo!',
                    )),
                  );
              }
            },
          ),
        ],
      ),
    );
  }
}
