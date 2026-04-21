import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:proyectos_amor/config/app_config.dart';
import 'package:proyectos_amor/config/app_sentry.dart';
import 'package:proyectos_amor/features/create_account/logic/bloc/fetch_profile_bloc/fetch_profile_bloc.dart';
import 'package:proyectos_amor/injection.dart';
import 'package:intl/intl.dart';
import 'package:proyectos_amor/router/app_router.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppSentry.initialize(
    appRunner: () async {
      configureDependencies();
      await getIt<AppConfig>().initialize();
      getIt.registerSingleton<AppRouter>(AppRouter());
      Intl.defaultLocale = 'en';
      runApp(AppSentry.wrapApp(const MyApp()));
    },
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appRouter = getIt<AppRouter>();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return BlocProvider<FetchProfileBloc>(
      create: (_) => getIt<FetchProfileBloc>(),
      child: MaterialApp.router(
        routerConfig: _appRouter.config(
          navigatorObservers: () => [
            if (AppSentry.isEnabled) SentryNavigatorObserver(),
          ],
        ),
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('es', 'MX'),
        ],
        builder: (BuildContext context, Widget? child) {
          return child ?? const SizedBox();
        },
      ),
    );
  }
}
