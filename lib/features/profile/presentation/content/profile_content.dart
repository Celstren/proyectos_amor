import 'package:flutter/material.dart';
import 'package:proyectos_amor/features/profile/presentation/content/unauthenticated_profile/unauthenticated_profile.dart';

class ProfileContent extends StatefulWidget {
  const ProfileContent({super.key});

  @override
  State<ProfileContent> createState() => _ProfileContentState();
}

class _ProfileContentState extends State<ProfileContent> {
  @override
  Widget build(BuildContext context) {
    return const UnauthenticatedProfile();
  }
}
