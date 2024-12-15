import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:proyectos_amor/features/profile_picture_preview/presentation/content/profile_picture_preview_content.dart';

@RoutePage(name: 'ProfilePicturePreviewPageRoute')
class ProfilePicturePreviewPage extends StatelessWidget {
  const ProfilePicturePreviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProfilePicturePreviewContent();
  }
}
