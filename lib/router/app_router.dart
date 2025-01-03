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
    CustomRoute(
      page: CodeVerificationPageRoute.page,
      path: AppRoutePath.codeVerificationScreenPath,
    ),
    CustomRoute(
      page: NotificationsPageRoute.page,
      path: AppRoutePath.notificationScreenPath,
    ),
    CustomRoute(
      page: DonateGiftPageRoute.page,
      path: AppRoutePath.donateGiftScreenPath,
    ),
    CustomRoute(
      page: DonateMoneyPageRoute.page,
      path: AppRoutePath.donateMoneyScreenPath,
    ),
    CustomRoute(
      page: ConfirmDonationPageRoute.page,
      path: AppRoutePath.confirmDonationScreenPath,
    ),
    CustomRoute(
      page: DonationDetailPageRoute.page,
      path: AppRoutePath.donationDetailScreenPath,
    ),
    CustomRoute(
      page: ProfilePicturePreviewPageRoute.page,
      path: AppRoutePath.profilePicturePreviewScreenPath,
    ),
    CustomRoute(
      page: EditProfilePageRoute.page,
      path: AppRoutePath.editProfileScreenPath,
    ),
    CustomRoute(
      page: AccountPageRoute.page,
      path: AppRoutePath.accountScreenPath,
    ),
    CustomRoute(
      page: EditPasswordPageRoute.page,
      path: AppRoutePath.editPasswordScreenPath,
    ),
    CustomRoute(
      page: DeleteAccountPageRoute.page,
      path: AppRoutePath.deleteAccountScreenPath,
    ),
  ];
}