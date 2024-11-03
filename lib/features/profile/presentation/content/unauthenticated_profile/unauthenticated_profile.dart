import 'package:app_ui/app_constants/colors_constant.dart';
import 'package:app_ui/app_constants/size_constants.dart';
import 'package:app_ui/app_image/app_icon.dart';
import 'package:app_ui/app_text/app_text.dart';
import 'package:flutter/material.dart';
import 'package:proyectos_amor/features/profile/presentation/content/unauthenticated_profile/unauthorized_profile_tabs/unauthorized_profile_tabs.dart';
import 'package:proyectos_amor/features/profile/profile_strings.dart';

class UnauthenticatedProfile extends StatefulWidget {
  const UnauthenticatedProfile({super.key});

  @override
  State<UnauthenticatedProfile> createState() => _UnauthenticatedProfileState();
}

class _UnauthenticatedProfileState extends State<UnauthenticatedProfile> with TickerProviderStateMixin {
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
                      const SizedBox(height: 45),
                      Container(
                        height: 102,
                        width: 102,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorsConstant.neutralWhite,
                        ),
                        child: const Center(
                          child: AppIcon.userRoundedFilledIcon(
                            color: ColorsConstant.text600,
                            size: 32,
                          ),
                        ),
                      ),
                      const SizedBox(height: SizeConstants.xl),
                      const AppText.semiBold(
                        ProfileStrings.unauthenticatedProfileTitle,
                        fontSize: 18,
                        fontColor: ColorsConstant.text950,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: SizeConstants.xs),
                      const Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          AppText.normal(
                            ProfileStrings.unauthenticatedProfileSubTitle1,
                            fontSize: 14,
                            fontColor: ColorsConstant.text950,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(width: SizeConstants.sm),
                          AppText.semiBold(
                            ProfileStrings.unauthenticatedProfileSubTitle2,
                            fontSize: 14,
                            fontColor: ColorsConstant.text950,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      const SizedBox(height: 52),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: UnauthorizedProfileTabs(tabController: tabController),
        ),
      ),
    );
  }
}
