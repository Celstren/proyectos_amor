import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

extension DonateGiftDateExtension on DateTime {
  DateTime get pickupAt => this;

  String get confirmText =>
      DateFormat('dd MMM yyyy, h:mm a', 'es_MX').format(this);
}

class DonateGiftDateCubit extends Cubit<DateTime?> {
  DonateGiftDateCubit() : super(null);

  void change(DateTime? date) => emit(date);
}
