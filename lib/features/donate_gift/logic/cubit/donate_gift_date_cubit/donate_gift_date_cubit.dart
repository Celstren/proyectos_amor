import 'package:flutter_bloc/flutter_bloc.dart';

enum GiftDate { now, inHours, tomorrow, other }

extension GiftDateExtension on GiftDate {
  String get text {
    switch(this) {
      case GiftDate.now:
        return 'Ahora mismo';
      case GiftDate.inHours:
        return 'En unas horas';
      case GiftDate.tomorrow:
        return 'Mañana';
      case GiftDate.other:
        return 'Otro';
    }
  }
}

class DonateGiftDateCubit extends Cubit<GiftDate?> {
  DonateGiftDateCubit() : super(null);

  void change(GiftDate? date) => emit(date);
}