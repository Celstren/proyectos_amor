import 'package:app_ui/app_scaffold/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:proyectos_amor/features/account/presentation/content/account_header/account_header.dart';
import 'package:proyectos_amor/features/account/presentation/content/account_options/account_options.dart';

class AccountContent extends StatefulWidget {
  const AccountContent({super.key});

  @override
  State<AccountContent> createState() => _AccountContentState();
}

class _AccountContentState extends State<AccountContent> {
  @override
  Widget build(BuildContext context) {
    return const AppScaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          AccountHeader(),
          Expanded(child: AccountOptions()),
        ],
      ),
    );
  }
}
