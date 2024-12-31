import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:proyectos_amor/features/edit_profile/presentation/content/edit_profile_content.dart';

@RoutePage(name: 'EditProfilePageRoute')
class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const EditProfileContent();
  }
}
