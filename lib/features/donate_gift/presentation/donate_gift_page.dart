import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyectos_amor/features/donate_gift/logic/cubit/donate_gift_date_cubit/donate_gift_date_cubit.dart';
import 'package:proyectos_amor/features/donate_gift/logic/cubit/donate_gift_location_cubit/donate_gift_location_cubit.dart';
import 'package:proyectos_amor/features/donate_gift/logic/cubit/donate_gift_step_cubit/donate_gift_step_cubit.dart';
import 'package:proyectos_amor/features/donate_gift/logic/cubit/donate_gift_type_cubit/donate_gift_type_cubit.dart';
import 'package:proyectos_amor/features/donate_gift/presentation/content/donate_gift_content.dart';

@RoutePage(name: 'DonateGiftPageRoute')
class DonateGiftPage extends StatelessWidget {
  const DonateGiftPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: <BlocProvider>[
        BlocProvider<DonateGiftStepCubit>(create: (_) => DonateGiftStepCubit()),
        BlocProvider<DonateGiftTypeCubit>(create: (_) => DonateGiftTypeCubit()),
        BlocProvider<DonateGiftLocationCubit>(create: (_) => DonateGiftLocationCubit()),
        BlocProvider<DonateGiftDateCubit>(create: (_) => DonateGiftDateCubit()),
      ],
      child: const DonateGiftContent(),
    );
  }
}
