import 'package:app_ui/app_constants/colors_constant.dart';
import 'package:app_ui/app_constants/size_constants.dart';
import 'package:app_ui/app_text/app_text.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:proyectos_amor/features/profile/presentation/content/authenticated_profile/authenticated_profile_tabs/authenticated_profile_tabs.dart';
import 'package:proyectos_amor/features/profile/profile_images.dart';
import 'package:proyectos_amor/router/app_router.gr.dart';

class AuthenticatedProfile extends StatefulWidget {
  const AuthenticatedProfile({super.key});

  @override
  State<AuthenticatedProfile> createState() => _AuthenticatedProfileState();
}

class _AuthenticatedProfileState extends State<AuthenticatedProfile> with TickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: ColorsConstant.background,
      child: SafeArea(
        top: false,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return <Widget>[
              SliverToBoxAdapter(
                child: Material(
                  color: ColorsConstant.secondaryColor,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      if (MediaQuery.of(context).viewPadding.top > 0)
                        SizedBox(height: MediaQuery.of(context).viewPadding.top),
                      GestureDetector(
                        onTap: () => AutoRouter.of(context).push(const LoginPageRoute()),
                        behavior: HitTestBehavior.opaque,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            const SizedBox(height: 24),
                            const Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 18),
                                child: Icon(
                                  Icons.edit,
                                  color: ColorsConstant.neutralBlack,
                                ),
                              ),
                            ),
                            const SizedBox(height: 12),
                            GestureDetector(
                              onTap: () => AutoRouter.of(context).push(const ProfilePicturePreviewPageRoute()),
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
                                  image: const DecorationImage(
                                    image: AssetImage(
                                      ProfileImages.profileUserPlaceholderIcon,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: SizeConstants.xl),
                            const AppText.bold(
                              'Juan Jose Torre',
                              fontSize: 18,
                              fontColor: ColorsConstant.splashPrimaryFontColor,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: SizeConstants.xs),
                            const AppText.normal(
                              'Sembrador de sonrisas',
                              fontSize: 14,
                              fontColor: ColorsConstant.splashPrimaryFontColor,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: SizeConstants.xs),
                            const AppText.normal(
                              'Soy parte del cambio desde Abril 2024',
                              fontSize: 12,
                              fontColor: ColorsConstant.textPlaceholder,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 52),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: AuthenticatedProfileTabs(tabController: tabController),
        ),
      ),
    );
  }
}
