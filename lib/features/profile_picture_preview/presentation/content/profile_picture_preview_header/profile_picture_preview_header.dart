import 'package:app_ui/app_constants/colors_constant.dart';
import 'package:app_ui/app_text/app_text.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:proyectos_amor/features/profile_picture_preview/profile_picture_preview_strings.dart';

class ProfilePicturePreviewHeader extends StatelessWidget {
  const ProfilePicturePreviewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: AutoRouter.of(context).maybePop,
      behavior: HitTestBehavior.opaque,
      child: const Padding(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.arrow_back,
              size: 24,
              color: ColorsConstant.splashPrimaryFontColor,
            ),
            SizedBox(width: 12),
            AppText.semiBold(
              ProfilePicturePreviewStrings.profilePicturePreviewHeader,
              fontColor: ColorsConstant.splashPrimaryFontColor,
              fontSize: 14,
              textAlign: TextAlign.start,
            ),
          ],
        ),
      ),
    );
  }
}
