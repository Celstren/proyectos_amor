import 'package:flutter/material.dart';
import 'package:proyectos_amor/features/profile/presentation/content/authenticated_profile/authenticated_profile_tabs/authenticated_profile_tabs_content/authenticated_about_content/authenticated_about_content.dart';
import 'package:proyectos_amor/features/profile/presentation/content/authenticated_profile/authenticated_profile_tabs/authenticated_profile_tabs_content/authenticated_donation_content/authenticated_donation_content.dart';

class AuthenticatedProfileTabsContent extends StatelessWidget {
  final TabController tabController;
  const AuthenticatedProfileTabsContent({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: tabController,
      children: const <Widget>[
        AuthenticatedAboutContent(),
        AuthenticatedDonationContent(),
      ],
    );
  }
}
