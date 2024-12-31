import 'package:app_ui/app_scaffold/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:proyectos_amor/features/edit_profile/presentation/content/edit_profile_bottom/edit_profile_bottom.dart';
import 'package:proyectos_amor/features/edit_profile/presentation/content/edit_profile_forms/edit_profile_forms.dart';
import 'package:proyectos_amor/features/edit_profile/presentation/content/edit_profile_header/edit_profile_header.dart';

class EditProfileContent extends StatefulWidget {
  const EditProfileContent({super.key});

  @override
  State<EditProfileContent> createState() => _EditProfileContentState();
}

class _EditProfileContentState extends State<EditProfileContent> {
  @override
  Widget build(BuildContext context) {
    return const AppScaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          EditProfileHeader(),
          Expanded(child: EditProfileForms()),
          EditProfileBottom(),
        ],
      ),
    );
  }
}
