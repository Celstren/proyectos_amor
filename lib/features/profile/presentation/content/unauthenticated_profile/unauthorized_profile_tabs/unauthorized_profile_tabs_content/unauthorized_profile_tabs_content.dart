import 'package:flutter/material.dart';
import 'package:proyectos_amor/features/profile/presentation/content/unauthenticated_profile/unauthorized_profile_tabs/unauthorized_profile_tabs_content/unauthorized_about_content/unauthorized_about_content.dart';
import 'package:proyectos_amor/features/profile/presentation/content/unauthenticated_profile/unauthorized_profile_tabs/unauthorized_profile_tabs_content/unauthorized_donations_content/unauthorized_donations_content.dart';

class UnauthorizedProfileTabsContent extends StatelessWidget {
  final TabController tabController;
  const UnauthorizedProfileTabsContent({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: tabController,
      children: const <Widget>[
        UnauthorizedAboutContent(),
        UnauthorizedDonationsContent(),
      ],
    );
  }
}
