import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:proyectos_amor/networking/app_api_error.dart';
import 'package:proyectos_amor/services/storage_service/entities/system_user_entity.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class AppSentry {
  static const _dsn = String.fromEnvironment('SENTRY_DSN');
  static const _enabled = bool.fromEnvironment(
    'SENTRY_ENABLED',
    defaultValue: kReleaseMode,
  );
  static const _environment = String.fromEnvironment('SENTRY_ENVIRONMENT');
  static const _tracesSampleRateValue = String.fromEnvironment(
    'SENTRY_TRACES_SAMPLE_RATE',
  );
  static const _profilesSampleRateValue = String.fromEnvironment(
    'SENTRY_PROFILES_SAMPLE_RATE',
  );

  static bool get isEnabled => _enabled && _dsn.isNotEmpty;

  static String get environment {
    if (_environment.isNotEmpty) return _environment;
    if (kReleaseMode) return 'production';
    if (kProfileMode) return 'profile';
    return 'debug';
  }

  static Future<void> initialize({required AppRunner appRunner}) async {
    if (!isEnabled) {
      await appRunner();
      return;
    }

    await SentryFlutter.init(
      (options) {
        options.dsn = _dsn;
        options.environment = environment;
        options.sendDefaultPii = false;
        options.tracesSampleRate = _parseSampleRate(_tracesSampleRateValue);
        options.profilesSampleRate = _parseSampleRate(
          _profilesSampleRateValue,
        );
        options.reportSilentFlutterErrors = true;
        options.attachScreenshot = false;
        options.attachViewHierarchy = false;
        options.debug = kDebugMode;
      },
      appRunner: appRunner,
    );
  }

  static Widget wrapApp(Widget child) {
    if (!isEnabled) return child;
    return SentryWidget(child: child);
  }

  static Future<void> captureApiError({
    required AppApiError error,
    required Object exception,
    required StackTrace stackTrace,
    required String feature,
    required String operation,
  }) async {
    if (!isEnabled) return;

    await Sentry.captureException(
      exception,
      stackTrace: stackTrace,
      withScope: (scope) {
        scope.setTag('feature', feature);
        scope.setTag('operation', operation);
        if (error.errorCode != null) {
          scope.setTag('errorCode', error.errorCode!);
        }
        if (error.statusCode != null) {
          scope.setTag('statusCode', error.statusCode.toString());
        }
        scope.setContexts('apiError', error.trackingContext);
      },
    );
  }

  static Future<void> setUser(SystemUserEntity user) async {
    if (!isEnabled) return;

    await Sentry.configureScope((scope) {
      scope.setUser(
        SentryUser(
          id: user.userId,
        ),
      );
    });
  }

  static Future<void> clearUser() async {
    if (!isEnabled) return;

    await Sentry.configureScope((scope) {
      scope.setUser(null);
    });
  }

  static double? _parseSampleRate(String value) {
    if (value.isEmpty) return null;

    final sampleRate = double.tryParse(value);
    if (sampleRate == null || sampleRate < 0 || sampleRate > 1) {
      return null;
    }

    return sampleRate;
  }
}
