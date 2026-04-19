import 'package:auto_route/auto_route.dart';
import 'package:proyectos_amor/injection.dart';
import 'package:proyectos_amor/router/app_router.gr.dart';
import 'package:proyectos_amor/services/shared_preferences_service/shared_preferences_keys.dart';
import 'package:proyectos_amor/services/shared_preferences_service/shared_preferences_service.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(
    NavigationResolver resolver,
    StackRouter router,
  ) {
    final sharedPreferencesService = getIt<SharedPreferencesService>();
    final token = sharedPreferencesService.getString(
      SharedPreferencesKeys.accessTokenKey,
    );

    // List of routes that can be accessed without an active session
    final publicRoutes = [
      OnboardingPageRoute.name,
      LoginPageRoute.name,
      CreateAccountPageRoute.name,
      ForgotPasswordPageRoute.name,
      CodeVerificationPageRoute.name,
    ];

    final isPublicRoute = publicRoutes.contains(resolver.route.name);

    if (token.isEmpty) {
      if (isPublicRoute) {
        resolver.next(true);
      } else {
        router.push(const OnboardingPageRoute());
      }
    } else {
      if (isPublicRoute) {
        // If session exists and trying to access a public route, redirect to Dashboard
        router.push(const DashboardPageRoute());
      } else {
        resolver.next(true);
      }
    }
  }
}
