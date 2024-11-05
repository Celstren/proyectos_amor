import 'package:auto_route/auto_route.dart';
import 'package:proyectos_amor/router/app_router.gr.dart';
import 'package:proyectos_amor/router/app_router_path.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<CustomRoute> get routes => [
    CustomRoute(
      initial: true,
      page: OnboardingPageRoute.page,
      path: AppRoutePath.onboardingScreenPath,
    ),
    CustomRoute(
      page: DashboardPageRoute.page,
      path: AppRoutePath.dashboardScreenPath,
      children: <CustomRoute>[
        CustomRoute(
          page: HomePageRoute.page,
          path: AppRoutePath.homeScreenPath,
        ),
        CustomRoute(
          page: AwardPageRoute.page,
          path: AppRoutePath.awardScreenPath,
        ),
        CustomRoute(
          page: ProfilePageRoute.page,
          path: AppRoutePath.profileScreenPath,
        ),
      ],
    ),
    CustomRoute(
      page: LoginPageRoute.page,
      path: AppRoutePath.loginScreenPath,
    ),
    CustomRoute(
      page: CreateAccountPageRoute.page,
      path: AppRoutePath.createAccountScreenPath,
    ),
    CustomRoute(
      page: ClaimCertificationPageRoute.page,
      path: AppRoutePath.claimCertificationScreenPath,
    ),
    CustomRoute(
      page: ForgotPasswordPageRoute.page,
      path: AppRoutePath.forgotPasswordScreenPath,
    ),
  ];
}