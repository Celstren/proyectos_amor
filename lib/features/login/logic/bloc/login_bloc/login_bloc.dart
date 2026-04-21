import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:proyectos_amor/services/authentication_service/authentication_service.dart';
import 'package:proyectos_amor/services/authentication_service/models/request/login_request.dart';
import 'package:proyectos_amor/services/storage_service/entities/system_user_entity.dart';
import 'package:proyectos_amor/services/storage_service/implementations/system_user_box_service.dart';
import 'package:proyectos_amor/services/user_service/user_service.dart';

part 'login_bloc.freezed.dart';

@freezed
class LoginEvent with _$LoginEvent {
  const factory LoginEvent.login() = Login;
}

@freezed
class LoginState with _$LoginState {
  const factory LoginState.loginUninitializedState() = LoginUninitializedState;
  const factory LoginState.loginLoadingState() = LoginLoadingState;
  const factory LoginState.loginSuccessState() = LoginSuccessState;
  const factory LoginState.loginErrorState({@Default('') String message}) =
      LoginErrorState;
  const factory LoginState.loginConnectionErrorState() =
      LoginConnectionErrorState;
  const factory LoginState.loginUnauthorizedState() = LoginUnauthorizedState;
}

/// [LoginBloc] manages the user authentication flow.
/// The process consists of:
/// 1. Authenticating the user via [AuthenticationService].
/// 2. Fetching the full user profile via [UserService].
/// 3. Storing the user data in local storage (ObjectBox) via [SystemUserBoxService].
@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(
    this._authenticationService,
    this._userService,
    this._systemUserBoxService,
  ) : super(const LoginUninitializedState()) {
    on<LoginEvent>(_onLoginEvent);
  }

  final AuthenticationService _authenticationService;
  final UserService _userService;
  final SystemUserBoxService _systemUserBoxService;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String get email => emailController.text.trim();
  String get password => passwordController.text.trim();

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }

  void _onLoginEvent(LoginEvent event, Emitter<LoginState> emitter) async {
    try {
      await event.when(
        login: () async {
          emitter(const LoginLoadingState());

          // 1. Authenticate (stores tokens in SharedPreferences)
          final request = LoginRequest(email: email, password: password);
          await _authenticationService.login(request: request);

          // 2. Fetch user profile
          final profile = await _userService.getProfile();

          // 3. Persist user data locally
          final userEntity = SystemUserEntity(
            userId: profile.id,
            email: profile.email,
            firstName: profile.profile?.firstName ?? '',
            lastName: profile.profile?.lastName ?? '',
            accountType: profile.accountType,
            role: profile.role,
            status: profile.status,
            profileImageUrl: profile.profile?.profileImageUrl,
            bio: profile.profile?.bio ?? '',
            createdAt: profile.createdAt?.toIso8601String() ?? '',
          );
          _systemUserBoxService.put(userEntity);

          emitter(const LoginSuccessState());
        },
      );
    } catch (e) {
      emitter(LoginErrorState(message: e.toString()));
    }
  }
}
