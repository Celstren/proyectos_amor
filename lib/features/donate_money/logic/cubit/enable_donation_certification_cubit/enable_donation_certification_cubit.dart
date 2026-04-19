import 'package:flutter_bloc/flutter_bloc.dart';

class EnableDonationCertificationCubit extends Cubit<bool> {
  EnableDonationCertificationCubit() : super(false);

  void change(bool value) => emit(value);
}