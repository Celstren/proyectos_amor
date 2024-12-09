import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

enum GiftType { food, toys, cleanArticles, clothes, homeArticles, cash }

extension GiftTypeExtension on GiftType {
  String get text {
    switch (this) {
      case GiftType.food:
        return 'Comida';
      case GiftType.toys:
        return 'Juguetes';
      case GiftType.cleanArticles:
        return 'Artículos de aseo';
      case GiftType.clothes:
        return 'Ropa';
      case GiftType.homeArticles:
        return 'Artículos de casa';
      case GiftType.cash:
        return 'Efectivo';
    }
  }
}

@injectable
class DonateGiftTypeCubit extends Cubit<GiftType?>{
  DonateGiftTypeCubit() : super(null);

  void change(GiftType? type) => emit(type);
}