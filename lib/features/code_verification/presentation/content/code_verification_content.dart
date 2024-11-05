import 'package:app_ui/app_constants/size_constants.dart';
import 'package:app_ui/app_scaffold/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:proyectos_amor/features/code_verification/presentation/content/code_verification_form/code_verification_form.dart';
import 'package:proyectos_amor/features/code_verification/presentation/content/code_verification_header/code_verification_header.dart';

class CodeVerificationContent extends StatefulWidget {
  const CodeVerificationContent({super.key});

  @override
  State<CodeVerificationContent> createState() => _CodeVerificationContentState();
}

class _CodeVerificationContentState extends State<CodeVerificationContent> {
  @override
  Widget build(BuildContext context) {
    return const AppScaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          CodeVerificationHeader(),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(SizeConstants.xl),
              child: CodeVerificationForm(),
            ),
          )
        ],
      ),
    );
  }
}
