import 'package:app_ui/app_constants/size_constants.dart';
import 'package:app_ui/app_scaffold/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:proyectos_amor/features/forgot_password/presentation/content/forgot_password_form/forgot_password_form.dart';
import 'package:proyectos_amor/features/forgot_password/presentation/content/forgot_password_header/forgot_password_header.dart';

class ForgotPasswordContent extends StatefulWidget {
  const ForgotPasswordContent({super.key});

  @override
  State<ForgotPasswordContent> createState() => _ForgotPasswordContentState();
}

class _ForgotPasswordContentState extends State<ForgotPasswordContent> {
  @override
  Widget build(BuildContext context) {
    return const AppScaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ForgotPasswordHeader(),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(SizeConstants.xl),
              child: ForgotPasswordForm(),
            ),
          )
        ],
      ),
    );
  }
}
