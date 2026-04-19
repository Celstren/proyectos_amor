import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:proyectos_amor/services/shared_preferences_service/shared_preferences_service.dart';
import 'package:proyectos_amor/services/storage_service/implementations/system_user_box_service.dart';

part 'logout_bloc.freezed.dart';

@freezed
class LogoutEvent with _$LogoutEvent {
  const factory LogoutEvent.logout() = Logout;
}

@freezed
class LogoutState with _$LogoutState {
  const factory LogoutState.logoutUninitializedState() = LogoutUninitializedState;
  const factory LogoutState.logoutLoadingState() = LogoutLoadingState;
  const factory LogoutState.logoutSuccessState() = LogoutSuccessState;
  const factory LogoutState.logoutErrorState({@Default('') String message}) = LogoutErrorState;
}

/// [LogoutBloc] handles the user sign-out process.
/// It ensures that all session data is cleared from:
/// 1. [SharedPreferencesService] (Tokens and settings).
/// 2. [SystemUserBoxService] (Local user profile).
@injectable
class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  LogoutBloc(
    this._sharedPreferencesService,
    this._systemUserBoxService,
  ) : super(const LogoutUninitializedState()) {
    on<LogoutEvent>(_onLogoutEvent);
  }

  final SharedPreferencesService _sharedPreferencesService;
  final SystemUserBoxService _systemUserBoxService;

  void _onLogoutEvent(LogoutEvent event, Emitter<LogoutState> emitter) async {
    try {
      emitter(const LogoutLoadingState());

      // 1. Clear SharedPreferences (Tokens, keys, etc.)
      await _sharedPreferencesService.clear();

      // 2. Clear ObjectBox (Local user entity)
      _systemUserBoxService.removeAll();

      emitter(const LogoutSuccessState());
    } catch (e) {
      emitter(LogoutErrorState(message: e.toString()));
    }
  }
}
