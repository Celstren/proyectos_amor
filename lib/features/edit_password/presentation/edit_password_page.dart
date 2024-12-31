import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:proyectos_amor/features/edit_password/presentation/content/edit_password_content.dart';

@RoutePage(name: 'EditPasswordPageRoute')
class EditPasswordPage extends StatelessWidget {
  const EditPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const EditPasswordContent();
  }
}
