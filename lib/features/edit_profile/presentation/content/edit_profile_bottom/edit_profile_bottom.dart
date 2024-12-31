import 'package:app_ui/app_button/app_button.dart';
import 'package:flutter/material.dart';
import 'package:proyectos_amor/features/edit_profile/edit_profile_strings.dart';

class EditProfileBottom extends StatelessWidget {
  const EditProfileBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18),
      child: AppButton.solid(
        text: EditProfileStrings.editProfileBottomPrimaryButton,
        radius: 56,
        onTap: () {},
      ),
    );
  }
}
