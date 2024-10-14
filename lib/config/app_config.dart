import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:proyectos_amor/services/storage_service/storage_service.dart';

@singleton
class AppConfig {
  final InternalStorageService _internalStorageService;
  BuildContext? context;
  var loggedWithBiometrics = false;

  AppConfig(this._internalStorageService);

  Future<void> initialize() async {
    await _internalStorageService.init();
  }
}