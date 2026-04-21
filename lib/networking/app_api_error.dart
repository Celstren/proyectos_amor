import 'dart:io';

import 'package:dio/dio.dart';
import 'package:proyectos_amor/networking/app_api_exception.dart';
import 'package:proyectos_amor/networking/app_api_error_strings.dart';

class AppApiError {
  final String message;
  final String? errorCode;
  final int? statusCode;

  const AppApiError({
    required this.message,
    this.errorCode,
    this.statusCode,
  });

  String get displayMessage => message;

  Map<String, Object?> get trackingContext => {
        'message': message,
        'errorCode': errorCode,
        'statusCode': statusCode,
      };

  bool get isUnauthorized => statusCode == 401;

  bool get isConnectionError =>
      errorCode == AppApiErrorCodes.noInternetConnection ||
      errorCode == AppApiErrorCodes.serverUnavailable ||
      errorCode == AppApiErrorCodes.connectionTimeout;

  factory AppApiError.fromException(Object error) {
    if (error is AppApiException) {
      return AppApiError(
        message: _messageForCode(
          error.errorCode,
          fallback: error.message,
        ),
        errorCode: error.errorCode,
        statusCode: error.statusCode,
      );
    }

    if (error is DioException) {
      return AppApiError.fromDioException(error);
    }

    return const AppApiError(
      message: AppApiErrorStrings.unexpected,
      errorCode: AppApiErrorCodes.unexpected,
    );
  }

  factory AppApiError.fromDioException(DioException error) {
    final response = error.response;
    if (response != null) {
      final data = response.data;
      final parsed = _parseResponseData(data);
      final errorCode = parsed.errorCode;

      return AppApiError(
        message: _messageForCode(
          errorCode,
          fallback: parsed.message,
        ),
        errorCode: errorCode,
        statusCode: parsed.statusCode ?? response.statusCode,
      );
    }

    final code = _codeFromDioType(error);
    return AppApiError(
      message: _messageForCode(code),
      errorCode: code,
    );
  }

  static _ParsedApiError _parseResponseData(dynamic data) {
    if (data is Map<String, dynamic>) {
      return _ParsedApiError(
        message: _readMessage(data['message']),
        errorCode: data['errorCode']?.toString(),
        statusCode: int.tryParse(data['statusCode']?.toString() ?? ''),
      );
    }

    if (data is Map) {
      return _ParsedApiError(
        message: _readMessage(data['message']),
        errorCode: data['errorCode']?.toString(),
        statusCode: int.tryParse(data['statusCode']?.toString() ?? ''),
      );
    }

    return _ParsedApiError(message: data?.toString());
  }

  static String? _readMessage(dynamic value) {
    if (value is List) {
      return value.map((item) => item.toString()).join('\n');
    }
    return value?.toString();
  }

  static String _codeFromDioType(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return AppApiErrorCodes.connectionTimeout;
      case DioExceptionType.connectionError:
        return AppApiErrorCodes.serverUnavailable;
      case DioExceptionType.cancel:
        return AppApiErrorCodes.requestCancelled;
      case DioExceptionType.badCertificate:
        return AppApiErrorCodes.badCertificate;
      case DioExceptionType.unknown:
        if (error.error is SocketException) {
          return AppApiErrorCodes.serverUnavailable;
        }
        return AppApiErrorCodes.unexpected;
      case DioExceptionType.badResponse:
        return AppApiErrorCodes.unexpected;
    }
  }

  static String _messageForCode(String? code, {String? fallback}) {
    switch (code) {
      case AppApiErrorCodes.noInternetConnection:
        return AppApiErrorStrings.noInternet;
      case AppApiErrorCodes.serverUnavailable:
        return AppApiErrorStrings.serverUnavailable;
      case AppApiErrorCodes.connectionTimeout:
        return AppApiErrorStrings.connectionTimeout;
      case AppApiErrorCodes.requestCancelled:
        return AppApiErrorStrings.requestCancelled;
      case AppApiErrorCodes.badCertificate:
        return AppApiErrorStrings.badCertificate;
      case 'AUTH_002':
        return AppApiErrorStrings.wrongCredentials;
      case 'AUTH_003':
        return AppApiErrorStrings.sessionExpired;
      case 'USER_003':
        return AppApiErrorStrings.deletedAccount;
      case 'USER_004':
        return AppApiErrorStrings.scheduledForDeletion;
      default:
        return fallback?.isNotEmpty == true
            ? fallback!
            : AppApiErrorStrings.unexpected;
    }
  }
}

class AppApiErrorCodes {
  static const noInternetConnection = 'NETWORK_001';
  static const serverUnavailable = 'NETWORK_002';
  static const connectionTimeout = 'NETWORK_003';
  static const requestCancelled = 'NETWORK_004';
  static const badCertificate = 'NETWORK_005';
  static const unexpected = 'APP_001';
}

class _ParsedApiError {
  final String? message;
  final String? errorCode;
  final int? statusCode;

  const _ParsedApiError({
    this.message,
    this.errorCode,
    this.statusCode,
  });
}
