import 'package:flutter/material.dart';
import 'package:proyectos_amor/features/profile/presentation/content/unauthenticated_profile/unauthorized_profile_tabs/unauthorized_profile_tabs_content/unauthorized_profile_tabs_content.dart';
import 'package:proyectos_amor/features/profile/presentation/content/unauthenticated_profile/unauthorized_profile_tabs/unauthorized_profile_tabs_header/unauthorized_profile_tabs_header.dart';

class UnauthorizedProfileTabs extends StatelessWidget {
  final TabController tabController;
  const UnauthorizedProfileTabs({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        UnauthorizedProfileTabsHeader(tabController: tabController),
        Flexible(child: UnauthorizedProfileTabsContent(tabController: tabController)),
      ],
    );
  }
}
