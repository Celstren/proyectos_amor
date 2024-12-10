import 'package:flutter/material.dart';
import 'package:proyectos_amor/features/profile/presentation/content/authenticated_profile/authenticated_profile_tabs/authenticated_profile_tabs_content/authenticated_about_content/authenticated_certifications.dart';
import 'package:proyectos_amor/features/profile/presentation/content/authenticated_profile/authenticated_profile_tabs/authenticated_profile_tabs_content/authenticated_about_content/authenticated_leaderboard.dart';
import 'package:proyectos_amor/features/profile/presentation/content/unauthenticated_profile/unauthorized_profile_tabs/unauthorized_profile_tabs_content/unauthorized_about_content/unauthorized_sharing/unauthorized_sharing.dart';
import 'package:proyectos_amor/features/profile/presentation/content/unauthenticated_profile/unauthorized_profile_tabs/unauthorized_profile_tabs_content/unauthorized_about_content/unauthorized_social/unauthorized_social.dart';

class AuthenticatedAboutContent extends StatelessWidget {
  const AuthenticatedAboutContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(height: 24),
          AuthenticatedLeaderboard(),
          SizedBox(height: 24),
          AuthenticatedCertifications(),
          UnauthorizedSharing(),
          UnauthorizedSocial(),
        ],
      ),
    );
  }
}
