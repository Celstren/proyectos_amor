import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:proyectos_amor/networking/logging_interceptor.dart';
import 'package:proyectos_amor/networking/token_interceptor.dart';

@module
abstract class AppModule {
  @LazySingleton()
  FlutterSecureStorage get secureStorage => const FlutterSecureStorage(
        aOptions: AndroidOptions(encryptedSharedPreferences: true),
      );

  @Named('rawDio')
  @lazySingleton
  Dio rawDio() => Dio();

  @LazySingleton()
  Dio dio(LoggingInterceptors logging, TokenInterceptor token) {
    final client = Dio();
    client.interceptors
      ..add(logging)
      ..add(token);
    return client;
  }
}
