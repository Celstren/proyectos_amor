import 'package:flutter_bloc/flutter_bloc.dart';

enum CreateAccountStep { about, picture, personal, password, completed }

class ChangeCreateAccountStepCubit extends Cubit<CreateAccountStep> {
  ChangeCreateAccountStepCubit() : super(CreateAccountStep.about);

  void change(CreateAccountStep step) => emit(step);
}
