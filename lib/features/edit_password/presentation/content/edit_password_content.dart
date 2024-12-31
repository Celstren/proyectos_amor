import 'package:app_ui/app_scaffold/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:proyectos_amor/features/edit_password/presentation/content/edit_password_bottom/edit_password_bottom.dart';
import 'package:proyectos_amor/features/edit_password/presentation/content/edit_password_forms/edit_password_forms.dart';
import 'package:proyectos_amor/features/edit_password/presentation/content/edit_password_header/edit_password_header.dart';

class EditPasswordContent extends StatefulWidget {
  const EditPasswordContent({super.key});

  @override
  State<EditPasswordContent> createState() => _EditPasswordContentState();
}

class _EditPasswordContentState extends State<EditPasswordContent> {
  @override
  Widget build(BuildContext context) {
    return const AppScaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          EditPasswordHeader(),
          Expanded(child: EditPasswordForms()),
          EditPasswordBottom(),
        ],
      ),
    );
  }
}
