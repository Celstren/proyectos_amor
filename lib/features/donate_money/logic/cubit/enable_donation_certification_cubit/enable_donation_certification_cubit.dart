import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class EnableDonationCertificationCubit extends Cubit<bool> {
  EnableDonationCertificationCubit() : super(false);

  void change(bool value) => emit(value);
}