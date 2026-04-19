import 'package:flutter_bloc/flutter_bloc.dart';

enum GiftLocation { location1, location2, location3, location4, location5 }

extension GiftLocationExtension on GiftLocation {
  String get text {
    switch(this) {
      case GiftLocation.location1:
        return 'San Miguel';
      case GiftLocation.location2:
        return 'Pueblo Libre';
      case GiftLocation.location3:
        return 'San Juan de Lurigancho';
      case GiftLocation.location4:
        return 'Ate';
      case GiftLocation.location5:
        return 'Cercado de Lima';
    }
  }
}

class DonateGiftLocationCubit extends Cubit<GiftLocation?> {
  DonateGiftLocationCubit() : super(null);

  void change(GiftLocation? location) => emit(location);
}