import 'package:flutter_bloc/flutter_bloc.dart';

enum DonateGiftStep { giftType, information, locations, deliveryDate }

class DonateGiftStepCubit extends Cubit<DonateGiftStep> {
  DonateGiftStepCubit() : super(DonateGiftStep.giftType);

  void change(DonateGiftStep step) => emit(step);
}