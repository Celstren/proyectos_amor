import 'package:app_ui/app_constants/colors_constant.dart';
import 'package:app_ui/app_constants/size_constants.dart';
import 'package:app_ui/app_image/app_icon.dart';
import 'package:app_ui/app_text/app_text.dart';
import 'package:flutter/material.dart';
import 'package:proyectos_amor/features/notifications/notifications_images.dart';
import 'package:proyectos_amor/features/notifications/notifications_strings.dart';

class NotificationsEmpty extends StatelessWidget {
  const NotificationsEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(SizeConstants.xl),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          AppIcon(
            asset: NotificationsImages.notificationBellIcon,
            size: 80,
          ),
          SizedBox(height: SizeConstants.lg),
          AppText.normal(
            NotificationsStrings.notificationsEmptyText,
            fontColor: ColorsConstant.text600,
            fontSize: 14,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
