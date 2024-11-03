import 'package:flutter/material.dart';
import 'package:proyectos_amor/features/profile/presentation/content/unauthenticated_profile/unauthorized_profile_tabs/unauthorized_profile_tabs_content/unauthorized_about_content/unauthorized_sharing/unauthorized_sharing.dart';
import 'package:proyectos_amor/features/profile/presentation/content/unauthenticated_profile/unauthorized_profile_tabs/unauthorized_profile_tabs_content/unauthorized_about_content/unauthorized_social/unauthorized_social.dart';

class UnauthorizedAboutContent extends StatelessWidget {
  const UnauthorizedAboutContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          UnauthorizedSharing(),
          UnauthorizedSocial(),
        ],
      ),
    );
  }
}
