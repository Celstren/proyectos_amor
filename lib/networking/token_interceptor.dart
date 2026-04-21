import 'dart:io';
import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:proyectos_amor/config/app_constants.dart';
import 'package:proyectos_amor/networking/app_api_exception.dart';
import 'package:proyectos_amor/services/authentication_service/models/request/refresh_token_request.dart';
import 'package:proyectos_amor/services/authentication_service/models/response/refresh_token_response.dart';
import 'package:proyectos_amor/services/shared_preferences_service/shared_preferences_keys.dart';
import 'package:proyectos_amor/services/shared_preferences_service/shared_preferences_service.dart';

VoidCallback? onUnauthorized;

@injectable
class TokenInterceptor extends Interceptor {
  TokenInterceptor(
    @Named('rawDio') this._rawDio,
    this._sharedPreferencesService,
  );

  final Dio _rawDio;
  final SharedPreferencesService _sharedPreferencesService;

  // Prevent refresh storms
  Future<String>? _refreshing;

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final is401 = err.response?.statusCode == HttpStatus.unauthorized;
    final isRefresh = (err.requestOptions.extra['is_refresh'] ?? false) == true;
    final isRetry = (err.requestOptions.extra['is_retry'] ?? false) == true;
    final path = err.requestOptions.path;

    if (!is401 ||
        isRefresh ||
        isRetry ||
        path.contains('/auth/login') ||
        path.contains('/auth/register')) {
      return super.onError(err, handler);
    }

    final refreshTokenValue = _sharedPreferencesService.getString(
      SharedPreferencesKeys.refreshTokenKey,
    );

    if (refreshTokenValue.isEmpty) {
      await _clearTokens();
      onUnauthorized?.call();
      return handler.reject(err);
    }

    try {
      // Only one refresh at a time
      _refreshing ??= _doRefresh(refreshTokenValue);
      final newAccessToken = await _refreshing!;
      _refreshing = null;

      // Retry the failed request with the fresh token
      final opts = err.requestOptions;

      final headers = Map<String, dynamic>.from(opts.headers);
      headers['Authorization'] = 'Bearer $newAccessToken';

      final retryOptions = opts.copyWith(
        headers: headers,
        extra: {...opts.extra, 'is_retry': true},
      );

      final response = await _rawDio.fetch(retryOptions);
      return handler.resolve(response);
    } catch (e) {
      _refreshing = null;
      await _clearTokens();
      onUnauthorized?.call();
      return handler.reject(err);
    }
  }

  Future<String> _doRefresh(String refreshToken) async {
    final request = RefreshTokenRequest(refreshToken: refreshToken);

    final resp = await _rawDio.post(
      '${AppConstants.baseURL}/auth/refresh',
      data: request.toJson(),
      options: Options(extra: {'is_refresh': true}),
    );

    if (resp.statusCode != HttpStatus.ok &&
        resp.statusCode != HttpStatus.created) {
      throw const AppApiException('Refresh failed');
    }

    final data = RefreshTokenResponse.fromJson(resp.data);
    final access = data.accessToken;
    await _sharedPreferencesService.setString(
        SharedPreferencesKeys.accessTokenKey, access);

    return access;
  }

  Future<void> _clearTokens() async {
    await _sharedPreferencesService.setString(
      SharedPreferencesKeys.accessTokenKey,
      '',
    );
    await _sharedPreferencesService.setString(
      SharedPreferencesKeys.refreshTokenKey,
      '',
    );
  }
}
