import 'package:flutter_bloc/flutter_bloc.dart';

/// [PasswordVisibilityCubit] manages the visibility state of a password field.
class PasswordVisibilityCubit extends Cubit<bool> {
  PasswordVisibilityCubit() : super(true);

  /// Toggles the visibility state between obscured and visible.
  void toggle() => emit(!state);
}
