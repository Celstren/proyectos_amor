import 'package:app_ui/app_button/app_button.dart';
import 'package:app_ui/app_constants/colors_constant.dart';
import 'package:app_ui/app_constants/size_constants.dart';
import 'package:app_ui/app_scaffold/app_scaffold.dart';
import 'package:app_ui/app_text/app_rich_text.dart';
import 'package:app_ui/app_text/app_text.dart';
import 'package:app_ui/app_text_field/app_labeled_text_field.dart';
import 'package:app_ui/app_text_field/app_password_text_field.dart';
import 'package:flutter/material.dart';
import 'package:proyectos_amor/features/login/login_strings.dart';

class LoginContent extends StatefulWidget {
  const LoginContent({super.key});

  @override
  State<LoginContent> createState() => _LoginContentState();
}

class _LoginContentState extends State<LoginContent> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(SizeConstants.xl),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const SizedBox(height: 56),
            const AppRichText(
              primaryText: LoginStrings.loginContentTitle1,
              primaryFontSize: 24,
              primaryFontColor: ColorsConstant.text950,
              secondaryText: ' ${LoginStrings.loginContentTitle2}',
              secondaryFontSize: 24,
              secondaryFontColor: ColorsConstant.secondaryFontColor,
            ),
            const SizedBox(height: 56),
            const AppLabeledTextField(
              label: LoginStrings.loginContentEmailLabel,
              hint: LoginStrings.loginContentEmailHint,
            ),
            const SizedBox(height: SizeConstants.md),
            const AppPasswordTextField(
              label: LoginStrings.loginContentPasswordLabel,
              hint: LoginStrings.loginContentPasswordHint,
            ),
            const SizedBox(height: SizeConstants.xl),
            GestureDetector(
              onTap: () {},
              behavior: HitTestBehavior.opaque,
              child: const AppText.normal(
                LoginStrings.loginContentForgotAccountLabel,
                fontColor: ColorsConstant.text950,
                fontSize: 16,
                textAlign: TextAlign.end,
              ),
            ),
            const SizedBox(height: SizeConstants.xl),
            AppButton.solid(
              onTap: () {},
              text: LoginStrings.loginContentPrimaryButton,
            ),
            const SizedBox(height: SizeConstants.xl),
            AppButton.link(
              onTap: () {},
              text: LoginStrings.loginContentSecondaryButton,
            ),
          ],
        ),
      ),
    );
  }
}
