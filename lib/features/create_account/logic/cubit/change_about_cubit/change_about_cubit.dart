import 'package:flutter_bloc/flutter_bloc.dart';

enum AboutEnum { person, school, company }

class ChangeAboutCubit extends Cubit<AboutEnum?> {
  ChangeAboutCubit() : super(null);

  void change(AboutEnum option) => emit(option);
}
