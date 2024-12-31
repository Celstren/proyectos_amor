import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:proyectos_amor/features/account/account_strings.dart';
import 'package:proyectos_amor/features/account/presentation/content/account_options/account_option.dart';
import 'package:proyectos_amor/router/app_router.gr.dart';

class AccountOptions extends StatelessWidget {
  const AccountOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          AccountOption(
            text: AccountStrings.accountOptions1,
            onTap: () => AutoRouter.of(context).push(const EditProfilePageRoute()),
          ),
          AccountOption(
            text: AccountStrings.accountOptions2,
            onTap: () => AutoRouter.of(context).push(const EditPasswordPageRoute()),
          ),
          AccountOption(
            text: AccountStrings.accountOptions3,
            onTap: () => AutoRouter.of(context).push(const DeleteAccountPageRoute()),
          ),
        ],
      ),
    );
  }
}
