import 'package:app_ui/app_constants/colors_constant.dart';
import 'package:app_ui/app_text/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyectos_amor/features/donate_money/donate_money_strings.dart';
import 'package:proyectos_amor/features/donate_money/logic/cubit/payment_method_cubit/payment_method_cubit.dart';
import 'package:app_ui/app_drop_down/app_drop_down.dart';
import 'package:proyectos_amor/features/donate_money/presentation/content/how_donate_money/bank_account_content.dart';
import 'package:proyectos_amor/features/donate_money/presentation/content/how_donate_money/cashier_content.dart';
import 'package:proyectos_amor/features/donate_money/presentation/content/how_donate_money/phone_number_content.dart';

class HowDonateMoney extends StatelessWidget {
  final PaymentMethodCubit paymentMethodCubit;
  const HowDonateMoney({super.key, required this.paymentMethodCubit});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 18),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const AppText.normal(
            DonateMoneyStrings.howDonateMoneyTitle,
            fontColor: ColorsConstant.splashPrimaryFontColor,
            fontSize: 12,
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: 18),
          BlocBuilder(
            bloc: paymentMethodCubit,
            builder: (context, PaymentMethod? methodState) => Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                AppDropDown(
                  optionSelected: methodState != null ? AppDropDownOption(
                    id: methodState.index,
                    value: methodState.text,
                  ) : null,
                  options: PaymentMethod.values.map(
                        (p) => AppDropDownOption(
                      id: p.index,
                      value: p.text,
                    ),
                  ).toList(),
                  onChanged: (e) {
                    if (e == null) return;
                    final method = PaymentMethod.values[e.id];
                    paymentMethodCubit.change(method);
                  },
                  hint: DonateMoneyStrings.howDonateMoneyHint,
                ),
                const SizedBox(height: 16),
                switch(methodState){
                  null => const SizedBox(),
                  PaymentMethod.yapePlin => const PhoneNumberContent(),
                  PaymentMethod.bank => const BankAccountContent(),
                  PaymentMethod.cashier => const CashierContent(),
                }
              ],
            ),
          ),
        ],
      ),
    );
  }
}
