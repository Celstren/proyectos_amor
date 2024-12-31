import 'package:app_ui/app_button/app_button.dart';
import 'package:flutter/material.dart';
import 'package:proyectos_amor/features/edit_password/edit_password_strings.dart';

class EditPasswordBottom extends StatelessWidget {
  const EditPasswordBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18),
      child: AppButton.solid(
        text: EditPasswordStrings.editPasswordBottomPrimaryButton,
        radius: 56,
        onTap: () {},
      ),
    );
  }
}
