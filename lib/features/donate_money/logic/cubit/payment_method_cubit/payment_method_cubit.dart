import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyectos_amor/features/donate_money/donate_money_strings.dart';

enum PaymentMethod { yapePlin, bank, cashier }

extension PaymentMethodExtension on PaymentMethod {
  String get text {
    switch (this) {
      case PaymentMethod.yapePlin:
        return DonateMoneyStrings.paymentMethodYapePlin;
      case PaymentMethod.bank:
        return DonateMoneyStrings.paymentMethodBank;
      case PaymentMethod.cashier:
        return DonateMoneyStrings.paymentMethodCashier;
    }
  }
}

class PaymentMethodCubit extends Cubit<PaymentMethod?> {
  PaymentMethodCubit() : super(null);

  void change(PaymentMethod method) => emit(method);
}
