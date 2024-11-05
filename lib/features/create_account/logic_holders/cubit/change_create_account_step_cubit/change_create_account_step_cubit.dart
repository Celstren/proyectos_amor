import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

enum CreateAccountStep { about, picture, personal, password, completed }

@injectable
class ChangeCreateAccountStepCubit extends Cubit<CreateAccountStep> {
  ChangeCreateAccountStepCubit() : super(CreateAccountStep.about);

  void change(CreateAccountStep step) => emit(step);
}