import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyectos_amor/features/donate_money/logic/cubit/donate_money_step_cubit/donate_money_step_cubit.dart';
import 'package:proyectos_amor/features/donate_money/logic/cubit/enable_donation_certification_cubit/enable_donation_certification_cubit.dart';
import 'package:proyectos_amor/features/donate_money/logic/cubit/payment_method_cubit/payment_method_cubit.dart';
import 'package:proyectos_amor/features/donate_money/presentation/content/donate_money_content.dart';

@RoutePage(name: 'DonateMoneyPageRoute')
class DonateMoneyPage extends StatelessWidget {
  const DonateMoneyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: <BlocProvider>[
        BlocProvider<DonateMoneyStepCubit>(create: (_) => DonateMoneyStepCubit()),
        BlocProvider<PaymentMethodCubit>(create: (_) => PaymentMethodCubit()),
        BlocProvider<EnableDonationCertificationCubit>(create: (_) => EnableDonationCertificationCubit()),
      ],
      child: const DonateMoneyContent(),
    );
  }
}
