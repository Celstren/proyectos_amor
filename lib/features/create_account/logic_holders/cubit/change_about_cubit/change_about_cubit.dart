import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

enum AboutEnum { person, school, company }

@injectable
class ChangeAboutCubit extends Cubit<AboutEnum?> {
  ChangeAboutCubit() : super(null);

  void change(AboutEnum option) => emit(option);
}