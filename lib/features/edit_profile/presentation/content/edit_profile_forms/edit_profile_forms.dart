import 'package:app_ui/app_text_field/app_labeled_text_field.dart';
import 'package:flutter/material.dart';
import 'package:proyectos_amor/features/edit_profile/edit_profile_strings.dart';

class EditProfileForms extends StatelessWidget {
  const EditProfileForms({super.key});

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
            label: EditProfileStrings.editProfileForms1Label,
            hint: EditProfileStrings.editProfileForms1Hint,
          ),
          SizedBox(height: 18),
          AppLabeledTextField(
            label: EditProfileStrings.editProfileForms2Label,
            hint: EditProfileStrings.editProfileForms2Hint,
          ),
          SizedBox(height: 18),
          AppLabeledTextField(
            label: EditProfileStrings.editProfileForms3Label,
            hint: EditProfileStrings.editProfileForms3Hint,
            enabled: false,
          ),
        ],
      ),
    );
  }
}
