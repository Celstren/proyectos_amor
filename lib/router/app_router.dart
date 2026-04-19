import 'package:auto_route/auto_route.dart';
import 'package:proyectos_amor/router/app_router.gr.dart';
import 'package:proyectos_amor/router/app_router_path.dart';
import 'package:proyectos_amor/router/guards/auth_guard.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<CustomRoute> get routes => [
    CustomRoute(
      page: OnboardingPageRoute.page,
      path: AppRoutePath.onboardingScreenPath,
    ),
    CustomRoute(
      initial: true,
      page: DashboardPageRoute.page,
      path: AppRoutePath.dashboardScreenPath,
      guards: [AuthGuard()],
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
      page: ForgotPasswordPageRoute.page,
      path: AppRoutePath.forgotPasswordScreenPath,
    ),
    CustomRoute(
      page: ClaimCertificationPageRoute.page,
      path: AppRoutePath.claimCertificationScreenPath,
      guards: [AuthGuard()],
    ),
    CustomRoute(
      page: CodeVerificationPageRoute.page,
      path: AppRoutePath.codeVerificationScreenPath,
    ),
    CustomRoute(
      page: NotificationsPageRoute.page,
      path: AppRoutePath.notificationScreenPath,
      guards: [AuthGuard()],
    ),
    CustomRoute(
      page: DonateGiftPageRoute.page,
      path: AppRoutePath.donateGiftScreenPath,
      guards: [AuthGuard()],
    ),
    CustomRoute(
      page: DonateMoneyPageRoute.page,
      path: AppRoutePath.donateMoneyScreenPath,
      guards: [AuthGuard()],
    ),
    CustomRoute(
      page: ConfirmDonationPageRoute.page,
      path: AppRoutePath.confirmDonationScreenPath,
      guards: [AuthGuard()],
    ),
    CustomRoute(
      page: DonationDetailPageRoute.page,
      path: AppRoutePath.donationDetailScreenPath,
      guards: [AuthGuard()],
    ),
    CustomRoute(
      page: ProfilePicturePreviewPageRoute.page,
      path: AppRoutePath.profilePicturePreviewScreenPath,
      guards: [AuthGuard()],
    ),
    CustomRoute(
      page: EditProfilePageRoute.page,
      path: AppRoutePath.editProfileScreenPath,
      guards: [AuthGuard()],
    ),
    CustomRoute(
      page: AccountPageRoute.page,
      path: AppRoutePath.accountScreenPath,
      guards: [AuthGuard()],
    ),
    CustomRoute(
      page: EditPasswordPageRoute.page,
      path: AppRoutePath.editPasswordScreenPath,
      guards: [AuthGuard()],
    ),
    CustomRoute(
      page: DeleteAccountPageRoute.page,
      path: AppRoutePath.deleteAccountScreenPath,
      guards: [AuthGuard()],
    ),
  ];
}
