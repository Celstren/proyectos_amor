import 'package:flutter_bloc/flutter_bloc.dart';

enum DonateMoneyStep { howToDonate, uploadVoucher }

class DonateMoneyStepCubit extends Cubit<DonateMoneyStep> {
  DonateMoneyStepCubit() : super(DonateMoneyStep.howToDonate);

  void change(DonateMoneyStep step) => emit(step);
}
