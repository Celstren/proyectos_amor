import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:proyectos_amor/services/shared_preferences_service/shared_preferences_service.dart';
import 'package:proyectos_amor/services/storage_service/storage_service.dart';

@singleton
class AppConfig {
  final InternalStorageService _internalStorageService;
  final SharedPreferencesService _sharedPreferencesService;
  BuildContext? context;
  var loggedWithBiometrics = false;

  AppConfig(this._internalStorageService, this._sharedPreferencesService);

  Future<void> initialize() async {
    await _internalStorageService.init();
    await _sharedPreferencesService.init();
  }
}