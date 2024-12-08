import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

enum DonateMoneyStep { howToDonate, uploadVoucher }

@injectable
class DonateMoneyStepCubit extends Cubit<DonateMoneyStep>{
  DonateMoneyStepCubit() : super(DonateMoneyStep.howToDonate);

  void change(DonateMoneyStep step) => emit(step);
}