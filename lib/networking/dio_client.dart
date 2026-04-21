import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:proyectos_amor/config/file_extension.dart';
import 'package:proyectos_amor/networking/app_api_exception.dart';
import 'package:proyectos_amor/services/shared_preferences_service/shared_preferences_keys.dart';
import 'package:proyectos_amor/services/shared_preferences_service/shared_preferences_service.dart';

@injectable
class DioClient {
  final Dio _client;
  final SharedPreferencesService _sharedPreferencesService;

  DioClient(this._client, this._sharedPreferencesService);

  Future<Response> get(
    String url, {
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
    Map<String, String>? queryParams,
    Map<String, dynamic>? extra,
    Duration? connectionTimeout,
    String? language,
    bool applyToken = true,
  }) async {
    if (!await _checkInternetConnection()) {
      throw const AppApiException(
        'No internet connection',
        errorCode: 'NETWORK_001',
      );
    }
    final dioHeaders = (headers ?? <String, dynamic>{});
    final token = _sharedPreferencesService
        .getString(SharedPreferencesKeys.accessTokenKey);
    dioHeaders.addAll({
      if (token.isNotEmpty && applyToken)
        HttpHeaders.authorizationHeader: 'Bearer $token',
    });
    if (connectionTimeout != null) {
      _client.options.connectTimeout = connectionTimeout;
    }
    return await _client.get(url,
        options: Options(headers: dioHeaders, extra: extra),
        queryParameters: queryParams,
        cancelToken: cancelToken);
  }

  Future<Response> post(
    String url, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? body,
    CancelToken? cancelToken,
    Map<String, String>? queryParams,
    Map<String, dynamic>? extra,
    Duration? connectionTimeout,
    String? language,
    bool applyToken = true,
  }) async {
    if (!await _checkInternetConnection()) {
      throw const AppApiException(
        'No internet connection',
        errorCode: 'NETWORK_001',
      );
    }
    final dioHeaders = (headers ?? <String, dynamic>{});
    final token = _sharedPreferencesService
        .getString(SharedPreferencesKeys.accessTokenKey);
    dioHeaders.addAll({
      if (token.isNotEmpty && applyToken)
        HttpHeaders.authorizationHeader: 'Bearer $token',
    });
    if (connectionTimeout != null) {
      _client.options.connectTimeout = connectionTimeout;
    }
    return await _client.post(
      url,
      data: body,
      options: Options(headers: dioHeaders, extra: extra),
      queryParameters: queryParams,
      cancelToken: cancelToken,
    );
  }

  Future<Response> put(
    String url, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? body,
    CancelToken? cancelToken,
    Map<String, String>? queryParams,
    Map<String, dynamic>? extra,
    Duration? connectionTimeout,
    String? language,
    bool applyToken = true,
  }) async {
    if (!await _checkInternetConnection()) {
      throw const AppApiException(
        'No internet connection',
        errorCode: 'NETWORK_001',
      );
    }
    final dioHeaders = (headers ?? <String, dynamic>{});
    final token = _sharedPreferencesService
        .getString(SharedPreferencesKeys.accessTokenKey);
    dioHeaders.addAll({
      if (token.isNotEmpty && applyToken)
        HttpHeaders.authorizationHeader: 'Bearer $token',
    });
    if (connectionTimeout != null) {
      _client.options.connectTimeout = connectionTimeout;
    }
    return await _client.put(
      url,
      data: body,
      options: Options(headers: dioHeaders, extra: extra),
      queryParameters: queryParams,
      cancelToken: cancelToken,
    );
  }

  Future<Response> patch(
    String url, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? body,
    CancelToken? cancelToken,
    Map<String, String>? queryParams,
    Map<String, dynamic>? extra,
    Duration? connectionTimeout,
    String? language,
    bool applyToken = true,
  }) async {
    if (!await _checkInternetConnection()) {
      throw const AppApiException(
        'No internet connection',
        errorCode: 'NETWORK_001',
      );
    }
    final dioHeaders = (headers ?? <String, dynamic>{});
    final token = _sharedPreferencesService
        .getString(SharedPreferencesKeys.accessTokenKey);
    dioHeaders.addAll({
      if (token.isNotEmpty && applyToken)
        HttpHeaders.authorizationHeader: 'Bearer $token',
    });
    if (connectionTimeout != null) {
      _client.options.connectTimeout = connectionTimeout;
    }
    return await _client.patch(
      url,
      data: body,
      options: Options(headers: dioHeaders, extra: extra),
      queryParameters: queryParams,
      cancelToken: cancelToken,
    );
  }

  Future<Response> delete(
    String url, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? body,
    CancelToken? cancelToken,
    Map<String, String>? queryParams,
    Map<String, dynamic>? extra,
    Duration? connectionTimeout,
    String? language,
    bool applyToken = true,
  }) async {
    if (!await _checkInternetConnection()) {
      throw const AppApiException(
        'No internet connection',
        errorCode: 'NETWORK_001',
      );
    }
    final dioHeaders = (headers ?? <String, dynamic>{});
    final token = _sharedPreferencesService
        .getString(SharedPreferencesKeys.accessTokenKey);
    dioHeaders.addAll({
      if (token.isNotEmpty && applyToken)
        HttpHeaders.authorizationHeader: 'Bearer $token',
    });
    if (connectionTimeout != null) {
      _client.options.connectTimeout = connectionTimeout;
    }
    return await _client.delete(
      url,
      data: body,
      options: Options(headers: dioHeaders, extra: extra),
      queryParameters: queryParams,
      cancelToken: cancelToken,
    );
  }

  Future<Response> download(
    String url,
    String savePath, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? body,
    CancelToken? cancelToken,
    Map<String, String>? queryParams,
    Map<String, dynamic>? extra,
    Duration? connectionTimeout,
    String? language,
    bool applyToken = true,
  }) async {
    if (!await _checkInternetConnection()) {
      throw const AppApiException(
        'No internet connection',
        errorCode: 'NETWORK_001',
      );
    }
    final dioHeaders = (headers ?? <String, dynamic>{});
    final token = _sharedPreferencesService
        .getString(SharedPreferencesKeys.accessTokenKey);
    dioHeaders.addAll({
      if (token.isNotEmpty && applyToken)
        HttpHeaders.authorizationHeader: 'Bearer $token',
    });
    if (connectionTimeout != null) {
      _client.options.connectTimeout = connectionTimeout;
    }
    return await _client.download(
      url,
      savePath,
      data: body,
      options: Options(headers: dioHeaders, extra: extra),
      queryParameters: queryParams,
      cancelToken: cancelToken,
    );
  }

  Future<Response> upload(
    String url, {
    required String path,
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
    Map<String, String>? queryParams,
    Map<String, dynamic>? extra,
    Duration? connectionTimeout,
    String? language,
    bool applyToken = true,
  }) async {
    if (!await _checkInternetConnection()) {
      throw const AppApiException(
        'No internet connection',
        errorCode: 'NETWORK_001',
      );
    }
    final dioHeaders = (headers ?? <String, dynamic>{});
    final token = _sharedPreferencesService
        .getString(SharedPreferencesKeys.accessTokenKey);
    dioHeaders.addAll({
      if (token.isNotEmpty && applyToken)
        HttpHeaders.authorizationHeader: 'Bearer $token',
    });
    if (connectionTimeout != null) {
      _client.options.connectTimeout = connectionTimeout;
    }

    final file = File(path);
    final formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(file.path,
          contentType: file.dioMediaType),
      if (data != null) ...data,
    });

    return await _client.post(
      url,
      data: formData,
      options: Options(headers: dioHeaders, extra: extra),
      queryParameters: queryParams,
      cancelToken: cancelToken,
    );
  }

  Future<Response> uploadRaw(
    String url, {
    Map<String, dynamic>? headers,
    String path = '',
    CancelToken? cancelToken,
    Map<String, String>? queryParams,
    Map<String, dynamic>? extra,
    Duration? connectionTimeout,
    String? language,
    bool applyToken = true,
  }) async {
    if (!await _checkInternetConnection()) {
      throw const AppApiException(
        'No internet connection',
        errorCode: 'NETWORK_001',
      );
    }
    final dioHeaders = (headers ?? <String, dynamic>{});
    final token = _sharedPreferencesService
        .getString(SharedPreferencesKeys.accessTokenKey);
    final file = File(path);
    dioHeaders.addAll({
      if (token.isNotEmpty && applyToken)
        HttpHeaders.authorizationHeader: 'Bearer $token',
    });
    if (connectionTimeout != null) {
      _client.options.connectTimeout = connectionTimeout;
    }
    return await _client.put(
      url,
      data: file.openRead(),
      options: Options(headers: dioHeaders, extra: extra),
      queryParameters: queryParams,
      cancelToken: cancelToken,
    );
  }

  Future<Response> fetchRaw({required RequestOptions requestOptions}) async {
    if (!await _checkInternetConnection()) {
      throw const AppApiException(
        'No internet connection',
        errorCode: 'NETWORK_001',
      );
    }
    final token = _sharedPreferencesService
        .getString(SharedPreferencesKeys.accessTokenKey);
    requestOptions.headers.addAll({
      if (token.isNotEmpty) HttpHeaders.authorizationHeader: 'Bearer $token',
    });
    return await _client.fetch(requestOptions);
  }

  Future<bool> _checkInternetConnection({bool test = false}) async {
    if (test) return true;
    var connectivityResult = await (Connectivity().checkConnectivity());
    return connectivityResult.contains(ConnectivityResult.wifi) ||
        connectivityResult.contains(ConnectivityResult.ethernet) ||
        connectivityResult.contains(ConnectivityResult.mobile);
  }
}
