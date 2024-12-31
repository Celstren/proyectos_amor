import 'package:app_ui/app_scaffold/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:proyectos_amor/features/delete_account/presentation/content/delete_account_bottom/delete_account_bottom.dart';
import 'package:proyectos_amor/features/delete_account/presentation/content/delete_account_forms/delete_account_forms.dart';
import 'package:proyectos_amor/features/delete_account/presentation/content/delete_account_header/delete_account_header.dart';
import 'package:proyectos_amor/features/delete_account/presentation/content/delete_account_message/delete_account_message.dart';

class DeleteAccountContent extends StatefulWidget {
  const DeleteAccountContent({super.key});

  @override
  State<DeleteAccountContent> createState() => _DeleteAccountContentState();
}

class _DeleteAccountContentState extends State<DeleteAccountContent> {
  var confirmed = false;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const DeleteAccountHeader(),
          Expanded(
            child: confirmed
                ? const DeleteAccountForms()
                : const DeleteAccountMessage(),
          ),
          DeleteAccountBottom(
            confirmed: confirmed,
            onContinue: () {
              setState(() {
                confirmed = true;
              });
            },
          ),
        ],
      ),
    );
  }
}
