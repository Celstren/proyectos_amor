import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:proyectos_amor/features/create_account/presentation/content/create_account_content.dart';

@RoutePage(name: 'CreateAccountPageRoute')
class CreateAccountPage extends StatelessWidget {
  const CreateAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CreateAccountContent();
  }
}
