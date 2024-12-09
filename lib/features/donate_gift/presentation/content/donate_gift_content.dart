import 'package:app_ui/app_scaffold/app_scaffold.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyectos_amor/features/donate_gift/logic/cubit/donate_gift_date_cubit/donate_gift_date_cubit.dart';
import 'package:proyectos_amor/features/donate_gift/logic/cubit/donate_gift_location_cubit/donate_gift_location_cubit.dart';
import 'package:proyectos_amor/features/donate_gift/logic/cubit/donate_gift_step_cubit/donate_gift_step_cubit.dart';
import 'package:proyectos_amor/features/donate_gift/logic/cubit/donate_gift_type_cubit/donate_gift_type_cubit.dart';
import 'package:proyectos_amor/features/donate_gift/presentation/content/donate_gift_bottom/donate_gift_bottom.dart';
import 'package:proyectos_amor/features/donate_gift/presentation/content/donate_gift_date/donate_gift_date.dart';
import 'package:proyectos_amor/features/donate_gift/presentation/content/donate_gift_header/donate_gift_header.dart';
import 'package:proyectos_amor/features/donate_gift/presentation/content/donate_gift_information/donate_gift_information.dart';
import 'package:proyectos_amor/features/donate_gift/presentation/content/donate_gift_location/donate_gift_location.dart';
import 'package:proyectos_amor/features/donate_gift/presentation/content/donate_gift_type/donate_gift_type.dart';
import 'package:proyectos_amor/injection.dart';
import 'package:proyectos_amor/router/app_router.gr.dart';

class DonateGiftContent extends StatefulWidget {
  const DonateGiftContent({super.key});

  @override
  State<DonateGiftContent> createState() => _DonateGiftContentState();
}

class _DonateGiftContentState extends State<DonateGiftContent> {
  final donateGiftStepCubit = getIt<DonateGiftStepCubit>();
  final donateGiftTypeCubit = getIt<DonateGiftTypeCubit>();
  final donateGiftLocationCubit = getIt<DonateGiftLocationCubit>();
  final donateGiftDateCubit = getIt<DonateGiftDateCubit>();

  @override
  void dispose() {
    donateGiftStepCubit.close();
    donateGiftTypeCubit.close();
    donateGiftLocationCubit.close();
    donateGiftDateCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      safeTop: false,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          DonateGiftHeader(donateGiftStepCubit: donateGiftStepCubit),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: BlocBuilder(
                bloc: donateGiftStepCubit,
                builder: (context, DonateGiftStep stepState) {
                  switch(stepState) {
                    case DonateGiftStep.giftType:
                      return DonateGiftType(donateGiftTypeCubit: donateGiftTypeCubit);
                    case DonateGiftStep.information:
                      return DonateGiftInformation(donateGiftStepCubit: donateGiftStepCubit);
                    case DonateGiftStep.locations:
                      return DonateGiftLocation(donateGiftStepCubit: donateGiftStepCubit, donateGiftLocationCubit: donateGiftLocationCubit);
                    case DonateGiftStep.deliveryDate:
                      return DonateGiftDate(donateGiftStepCubit: donateGiftStepCubit, donateGiftDateCubit: donateGiftDateCubit);
                  }
                },
              ),
            ),
          ),
          BlocBuilder(
            bloc: donateGiftStepCubit,
            builder: (context, DonateGiftStep stepState) {
              switch(stepState) {
                case DonateGiftStep.giftType:
                  return DonateGiftBottom(
                    onNext: () => donateGiftStepCubit.change(DonateGiftStep.information),
                  );
                case DonateGiftStep.information:
                  return DonateGiftBottom(
                    onNext: () => donateGiftStepCubit.change(DonateGiftStep.locations),
                  );
                case DonateGiftStep.locations:
                  return DonateGiftBottom(
                    onNext: () => donateGiftStepCubit.change(DonateGiftStep.deliveryDate),
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
