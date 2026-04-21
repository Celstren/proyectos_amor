import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'password_validation_cubit.freezed.dart';

@freezed
class PasswordValidationState with _$PasswordValidationState {
  const factory PasswordValidationState({
    @Default(false) bool hasMinMaxChars,
    @Default(false) bool hasUppercase,
    @Default(false) bool hasLowercase,
    @Default(false) bool hasNumber,
    @Default(false) bool hasSpecialChar,
    @Default(false) bool isMatch,
  }) = _PasswordValidationState;

  const PasswordValidationState._();

  bool get isValid =>
      hasMinMaxChars &&
      hasUppercase &&
      hasLowercase &&
      hasNumber &&
      hasSpecialChar &&
      isMatch;
}

/// [PasswordValidationCubit] handles the logic for validating password requirements.
class PasswordValidationCubit extends Cubit<PasswordValidationState> {
  PasswordValidationCubit() : super(const PasswordValidationState());

  /// Validates the password against the requirements.
  void validate(String password, String confirmPassword) {
    final hasMinMaxChars = password.length >= 8 && password.length <= 20;
    final hasUppercase = password.contains(RegExp(r'[A-Z]'));
    final hasLowercase = password.contains(RegExp(r'[a-z]'));
    final hasNumber = password.contains(RegExp(r'[0-9]'));
    final hasSpecialChar = password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    final isMatch = password.isNotEmpty && password == confirmPassword;

    emit(state.copyWith(
      hasMinMaxChars: hasMinMaxChars,
      hasUppercase: hasUppercase,
      hasLowercase: hasLowercase,
      hasNumber: hasNumber,
      hasSpecialChar: hasSpecialChar,
      isMatch: isMatch,
    ));
  }
}
