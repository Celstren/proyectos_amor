import 'package:app_ui/app_constants/colors_constant.dart';
import 'package:app_ui/app_text/app_text.dart';
import 'package:app_ui/app_text_field/app_labeled_text_field.dart';
import 'package:flutter/material.dart';
import 'package:proyectos_amor/features/delete_account/delete_account_strings.dart';

class DeleteAccountForms extends StatelessWidget {
  const DeleteAccountForms({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      padding: EdgeInsets.all(18),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          AppText.normal(
            DeleteAccountStrings.deleteAccountFormsTitle,
            fontSize: 14,
            fontColor: ColorsConstant.splashPrimaryFontColor,
            textAlign: TextAlign.start,
          ),
          SizedBox(height: 18),
          AppLabeledTextField(
            label: DeleteAccountStrings.deleteAccountForms1Label,
            hint: DeleteAccountStrings.deleteAccountForms1Hint,
          ),
          SizedBox(height: 18),
          AppLabeledTextField(
            label: DeleteAccountStrings.deleteAccountForms2Label,
            hint: DeleteAccountStrings.deleteAccountForms2Hint,
          ),
        ],
      ),
    );
  }
}
