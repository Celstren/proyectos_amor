import 'package:app_ui/app_scaffold/app_scaffold.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyectos_amor/features/donate_money/logic/cubit/donate_money_step_cubit/donate_money_step_cubit.dart';
import 'package:proyectos_amor/features/donate_money/presentation/content/donate_money_bottom/donate_money_bottom.dart';
import 'package:proyectos_amor/features/donate_money/presentation/content/donate_money_header/donate_money_header.dart';
import 'package:proyectos_amor/features/donate_money/presentation/content/how_donate_money/how_donate_money.dart';
import 'package:proyectos_amor/features/donate_money/presentation/content/upload_voucher/upload_voucher.dart';
import 'package:proyectos_amor/router/app_router.gr.dart';

class DonateMoneyContent extends StatefulWidget {
  const DonateMoneyContent({super.key});

  @override
  State<DonateMoneyContent> createState() => _DonateMoneyContentState();
}

class _DonateMoneyContentState extends State<DonateMoneyContent> {

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      safeTop: false,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const DonateMoneyHeader(),
          Expanded(
            child: BlocBuilder<DonateMoneyStepCubit, DonateMoneyStep>(
              builder: (context, DonateMoneyStep stepState) {
                switch(stepState) {
                  case DonateMoneyStep.howToDonate:
                    return const HowDonateMoney();
                  case DonateMoneyStep.uploadVoucher:
                    return const UploadVoucher();
                }
              },
            ),
          ),
          BlocBuilder<DonateMoneyStepCubit, DonateMoneyStep>(
            builder: (context, DonateMoneyStep stepState) => DonateMoneyBottom(
              onNext: stepState == DonateMoneyStep.howToDonate ? () => context.read<DonateMoneyStepCubit>().change(DonateMoneyStep.uploadVoucher) : null,
              onDone: stepState == DonateMoneyStep.uploadVoucher ? () => AutoRouter.of(context).push(ConfirmDonationPageRoute(
                donation: 'S/ 100.00',
                approvedAt: '24 Abril 2024',
              )) : null,
            ),
          )
        ],
      ),
    );
  }
}
