import 'package:app_ui/app_constants/colors_constant.dart';
import 'package:app_ui/app_text/app_text.dart';
import 'package:flutter/material.dart';
import 'package:proyectos_amor/features/profile/profile_strings.dart';

class AuthenticatedCertifications extends StatelessWidget {
  const AuthenticatedCertifications({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            AppText.semiBold(
              ProfileStrings.authenticatedCertificationsTitle,
              fontSize: 14,
              fontColor: ColorsConstant.textPlaceholder,
              textAlign: TextAlign.start,
            ),
            SizedBox(width: 12),
            Icon(
              Icons.help,
              size: 20,
              color: ColorsConstant.textPlaceholder,
            ),
          ],
        ),
        SizedBox(height: 12),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            AppText.normal(
              ProfileStrings.authenticatedCertificationsDescription,
              fontSize: 12,
              fontColor: ColorsConstant.textPlaceholder,
              textAlign: TextAlign.start,
            ),
            SizedBox(width: 12),
            AppText.semiBold(
              ProfileStrings.authenticatedCertificationsButton,
              fontSize: 12,
              fontColor: ColorsConstant.textLink,
              textAlign: TextAlign.start,
            ),
          ],
        ),
      ],
    );
  }
}
