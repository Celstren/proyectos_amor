import 'package:flutter/material.dart';
import 'package:proyectos_amor/features/profile/presentation/content/authenticated_profile/authenticated_profile_tabs/authenticated_profile_tabs_content/authenticated_profile_tabs_content.dart';
import 'package:proyectos_amor/features/profile/presentation/content/authenticated_profile/authenticated_profile_tabs/authenticated_profile_tabs_header/authenticated_profile_tabs_header.dart';

class AuthenticatedProfileTabs extends StatelessWidget {
  final TabController tabController;
  const AuthenticatedProfileTabs({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        AuthenticatedProfileTabsHeader(tabController: tabController),
        Flexible(child: AuthenticatedProfileTabsContent(tabController: tabController)),
      ],
    );
  }
}
