import 'package:app_ui/app_button/app_button.dart';
import 'package:app_ui/app_constants/colors_constant.dart';
import 'package:app_ui/app_constants/size_constants.dart';
import 'package:app_ui/app_text/app_text.dart';
import 'package:app_ui/app_text_field/app_labeled_text_field.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:proyectos_amor/features/forgot_password/forgot_password_strings.dart';

class ForgotPasswordForm extends StatelessWidget {
  const ForgotPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        const AppText.normal(
          ForgotPasswordStrings.forgotPasswordFormTitle,
          fontSize: 12,
          fontColor: ColorsConstant.primaryColor950,
          textAlign: TextAlign.start,
        ),
        const SizedBox(height: SizeConstants.xl),
        const AppLabeledTextField(
          label: ForgotPasswordStrings.forgotPasswordFormEmailLabel,
          hint: ForgotPasswordStrings.forgotPasswordFormEmailHint,
        ),
        const SizedBox(height: SizeConstants.xl),
        AppButton.solid(
          text: ForgotPasswordStrings.forgotPasswordFormPrimaryButton,
          onTap: () {},
        ),
        const SizedBox(height: SizeConstants.xl),
        AppButton.link(
          text: ForgotPasswordStrings.forgotPasswordFormSecondaryButton,
          onTap: AutoRouter.of(context).maybePop,
        ),
      ],
    );
  }
}
