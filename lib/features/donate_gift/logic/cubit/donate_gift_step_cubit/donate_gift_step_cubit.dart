import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

enum DonateGiftStep { giftType, information, locations, deliveryDate }

@injectable
class DonateGiftStepCubit extends Cubit<DonateGiftStep> {
  DonateGiftStepCubit() : super(DonateGiftStep.giftType);

  void change(DonateGiftStep step) => emit(step);
}