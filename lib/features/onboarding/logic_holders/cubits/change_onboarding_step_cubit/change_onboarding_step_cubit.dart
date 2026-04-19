import 'package:flutter_bloc/flutter_bloc.dart';

class ChangeOnboardingStepCubit extends Cubit<int> {
  ChangeOnboardingStepCubit() : super(0);

  void change(int index) => emit(index);
}