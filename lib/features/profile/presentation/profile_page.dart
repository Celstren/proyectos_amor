import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:proyectos_amor/features/profile/presentation/content/profile_content.dart';

@RoutePage(name: 'ProfilePageRoute')
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProfileContent();
  }
}
