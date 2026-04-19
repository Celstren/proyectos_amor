import 'package:app_ui/app_button/app_button.dart';
import 'package:app_ui/app_constants/colors_constant.dart';
import 'package:app_ui/app_constants/size_constants.dart';
import 'package:app_ui/app_image/app_icon.dart';
import 'package:app_ui/app_text/app_text.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:proyectos_amor/features/create_account/logic/bloc/fetch_profile_bloc/fetch_profile_bloc.dart';
import 'package:proyectos_amor/features/profile/logic/bloc/logout_bloc/logout_bloc.dart';
import 'package:proyectos_amor/features/profile/presentation/content/authenticated_profile/authenticated_profile_tabs/authenticated_profile_tabs.dart';
import 'package:proyectos_amor/features/profile/profile_images.dart';
import 'package:proyectos_amor/router/app_router.gr.dart';

class AuthenticatedProfile extends StatefulWidget {
  const AuthenticatedProfile({super.key});

  @override
  State<AuthenticatedProfile> createState() => _AuthenticatedProfileState();
}

class _AuthenticatedProfileState extends State<AuthenticatedProfile>
    with TickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
    // Load local profile data immediately
    context.read<FetchProfileBloc>().add(const FetchLocalProfile());
  }

  void _showLogoutConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const AppText.bold('Cerrar sesión', fontSize: 18),
          content: const AppText.normal(
            '¿Estás seguro de que quieres cerrar sesión?',
            fontSize: 16,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const AppText.medium(
                'Cancelar',
                fontColor: ColorsConstant.text400,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);
                context.read<LogoutBloc>().add(const LogoutEvent.logout());
              },
              child: const AppText.medium(
                'Sí, cerrar sesión',
                fontColor: Colors.red,
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LogoutBloc, LogoutState>(
      listener: (context, state) {
        state.maybeWhen(
          logoutSuccessState: () => context.router.replaceAll([
            const OnboardingPageRoute(),
            const LoginPageRoute(),
          ]),
          logoutErrorState: (message) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(message),
                backgroundColor: Colors.red,
              ),
            );
          },
          orElse: () {},
        );
      },
      child: Material(
        color: ColorsConstant.background,
        child: SafeArea(
          top: false,
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return <Widget>[
                SliverToBoxAdapter(
                  child: Material(
                    color: ColorsConstant.secondaryColor,
                    child: BlocBuilder<FetchProfileBloc, FetchProfileState>(
                      builder: (context, state) {
                        final user = state.maybeWhen(
                          fetchProfileSuccessState: (user) => user,
                          orElse: () => null,
                        );

                        final formattedDate = user?.createdAt != null &&
                                user!.createdAt!.isNotEmpty
                            ? DateFormat('MMMM yyyy', 'es_MX').format(
                                DateTime.parse(user.createdAt!),
                              )
                            : '';

                        return Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            if (MediaQuery.of(context).viewPadding.top > 0)
                              SizedBox(
                                height: MediaQuery.of(context).viewPadding.top,
                              ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                const SizedBox(height: 24),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 18,
                                  ),
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: GestureDetector(
                                      onTap: () =>
                                          _showLogoutConfirmation(context),
                                      behavior: HitTestBehavior.opaque,
                                      child: const AppIcon.logoutIcon(
                                        color: ColorsConstant.neutralBlack,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Center(
                                  child: GestureDetector(
                                    onTap: () => AutoRouter.of(context).push(
                                      const ProfilePicturePreviewPageRoute(),
                                    ),
                                    behavior: HitTestBehavior.opaque,
                                    child: Container(
                                      height: 102,
                                      width: 102,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: ColorsConstant.neutralWhite,
                                        border: Border.all(
                                          color: ColorsConstant.neutralWhite,
                                        ),
                                        image: user?.profileImageUrl != null &&
                                                user!
                                                    .profileImageUrl!.isNotEmpty
                                            ? DecorationImage(
                                                image: NetworkImage(
                                                  user.profileImageUrl!,
                                                ),
                                                fit: BoxFit.cover,
                                              )
                                            : const DecorationImage(
                                                image: AssetImage(
                                                  ProfileImages
                                                      .profileUserPlaceholderIcon,
                                                ),
                                                fit: BoxFit.cover,
                                              ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: SizeConstants.xl),
                                AppText.bold(
                                  user?.fullName ?? 'Usuario',
                                  fontSize: 18,
                                  fontColor:
                                      ColorsConstant.splashPrimaryFontColor,
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: SizeConstants.xs),
                                AppText.normal(
                                  user?.role ?? 'Miembro',
                                  fontSize: 14,
                                  fontColor:
                                      ColorsConstant.splashPrimaryFontColor,
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: SizeConstants.xs),
                                if (formattedDate.isNotEmpty)
                                  AppText.normal(
                                    'Soy parte del cambio desde $formattedDate',
                                    fontSize: 12,
                                    fontColor: ColorsConstant.textPlaceholder,
                                    textAlign: TextAlign.center,
                                  ),
                                const SizedBox(height: SizeConstants.lg),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 64,
                                  ),
                                  child: AppButton.solid(
                                    onTap: () => AutoRouter.of(context).push(
                                      const AccountPageRoute(),
                                    ),
                                    text: 'Editar perfil',
                                  ),
                                ),
                                const SizedBox(height: 32),
                              ],
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ];
            },
            body: AuthenticatedProfileTabs(tabController: tabController),
          ),
        ),
      ),
    );
  }
}
