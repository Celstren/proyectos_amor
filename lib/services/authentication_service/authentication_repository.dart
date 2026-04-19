import 'package:injectable/injectable.dart';
import 'package:proyectos_amor/config/app_constants.dart';
import 'package:proyectos_amor/networking/dio_client.dart';
import 'package:proyectos_amor/services/authentication_service/models/request/login_request.dart';
import 'package:proyectos_amor/services/authentication_service/models/request/register_request.dart';
import 'package:proyectos_amor/services/authentication_service/models/response/login_response.dart';
import 'package:proyectos_amor/services/shared_preferences_service/shared_preferences_keys.dart';
import 'package:proyectos_amor/services/shared_preferences_service/shared_preferences_service.dart';

abstract class IAuthenticationRepository {
  Future<void> register({ required RegisterRequest request });
  Future<void> login({ required LoginRequest request });
}

@LazySingleton(as: IAuthenticationRepository)
class AuthenticationRepository implements IAuthenticationRepository {
  final DioClient _dioClient;
  final SharedPreferencesService _sharedPreferencesService;

  AuthenticationRepository(
      this._dioClient,
      this._sharedPreferencesService);

  @override
  Future<void> login({required LoginRequest request}) async {
    final response = await _dioClient.post(
      '${AppConstants.baseURL}/auth/login',
      body: request.toJson(),
    );
    final result = AuthenticatedResponse.fromJson(response.data as Map<String, dynamic>);
    await _sharedPreferencesService.setString(
      SharedPreferencesKeys.accessTokenKey,
      result.accessToken,
    );
    await _sharedPreferencesService.setString(
      SharedPreferencesKeys.refreshTokenKey,
      result.refreshToken,
    );
  }

  @override
  Future<void> register({required RegisterRequest request}) async {
    final response = await _dioClient.post(
      '${AppConstants.baseURL}/auth/register',
      body: request.toJson(),
    );
    final result = AuthenticatedResponse.fromJson(response.data as Map<String, dynamic>);
    await _sharedPreferencesService.setString(
      SharedPreferencesKeys.accessTokenKey,
      result.accessToken,
    );
    await _sharedPreferencesService.setString(
      SharedPreferencesKeys.refreshTokenKey,
      result.refreshToken,
    );
  }
}
