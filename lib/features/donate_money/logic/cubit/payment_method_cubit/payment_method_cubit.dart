import 'package:flutter_bloc/flutter_bloc.dart';

enum PaymentMethod { yapePlin, bank, cashier }

extension PaymentMethodExtension on PaymentMethod {
  String get text {
    switch(this) {
      case PaymentMethod.yapePlin:
        return 'Yape/Plin';
      case PaymentMethod.bank:
        return 'Déposito a BCP';
      case PaymentMethod.cashier:
        return 'Ventanilla';
    }
  }
}

class PaymentMethodCubit extends Cubit<PaymentMethod?>{
  PaymentMethodCubit() : super(null);

  void change(PaymentMethod method) => emit(method);
}