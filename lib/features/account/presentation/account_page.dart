import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:proyectos_amor/features/account/presentation/content/account_content.dart';

@RoutePage(name: 'AccountPageRoute')
class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AccountContent();
  }
}
