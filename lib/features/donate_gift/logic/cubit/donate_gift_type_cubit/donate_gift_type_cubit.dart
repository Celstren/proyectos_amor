import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyectos_amor/features/donate_gift/donate_gift_strings.dart';

enum GiftType { food, toys, cleanArticles, clothes, homeArticles, cash }

extension GiftTypeExtension on GiftType {
  String get text {
    switch (this) {
      case GiftType.food:
        return DonateGiftStrings.giftTypeFood;
      case GiftType.toys:
        return DonateGiftStrings.giftTypeToys;
      case GiftType.cleanArticles:
        return DonateGiftStrings.giftTypeCleanArticles;
      case GiftType.clothes:
        return DonateGiftStrings.giftTypeClothes;
      case GiftType.homeArticles:
        return DonateGiftStrings.giftTypeHomeArticles;
      case GiftType.cash:
        return DonateGiftStrings.giftTypeCash;
    }
  }
}

class DonateGiftTypeCubit extends Cubit<GiftType?> {
  DonateGiftTypeCubit() : super(null);

  void change(GiftType? type) => emit(type);
}
