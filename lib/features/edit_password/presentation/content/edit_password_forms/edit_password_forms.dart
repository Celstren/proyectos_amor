import 'package:app_ui/app_text_field/app_labeled_text_field.dart';
import 'package:flutter/material.dart';
import 'package:proyectos_amor/features/edit_password/edit_password_strings.dart';

class EditPasswordForms extends StatelessWidget {
  const EditPasswordForms({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      padding: EdgeInsets.all(18),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          AppLabeledTextField(
            label: EditPasswordStrings.editPasswordForms1Label,
            hint: EditPasswordStrings.editPasswordForms1Hint,
          ),
          SizedBox(height: 18),
          AppLabeledTextField(
            label: EditPasswordStrings.editPasswordForms2Label,
            hint: EditPasswordStrings.editPasswordForms2Hint,
          ),
          SizedBox(height: 18),
          AppLabeledTextField(
            label: EditPasswordStrings.editPasswordForms3Label,
            hint: EditPasswordStrings.editPasswordForms3Hint,
          ),
        ],
      ),
    );
  }
}
