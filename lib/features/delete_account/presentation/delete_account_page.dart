import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:proyectos_amor/features/delete_account/presentation/content/delete_account_content.dart';

@RoutePage(name: 'DeleteAccountPageRoute')
class DeleteAccountPage extends StatelessWidget {
  const DeleteAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const DeleteAccountContent();
  }
}
