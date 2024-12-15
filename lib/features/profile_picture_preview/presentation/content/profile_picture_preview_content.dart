import 'package:app_ui/app_scaffold/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:proyectos_amor/features/profile_picture_preview/presentation/content/profile_picture/profile_picture.dart';
import 'package:proyectos_amor/features/profile_picture_preview/presentation/content/profile_picture_preview_header/profile_picture_preview_header.dart';

class ProfilePicturePreviewContent extends StatefulWidget {
  const ProfilePicturePreviewContent({super.key});

  @override
  State<ProfilePicturePreviewContent> createState() => _ProfilePicturePreviewContentState();
}

class _ProfilePicturePreviewContentState extends State<ProfilePicturePreviewContent> {
  @override
  Widget build(BuildContext context) {
    return const AppScaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ProfilePicturePreviewHeader(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  ProfilePicture(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
