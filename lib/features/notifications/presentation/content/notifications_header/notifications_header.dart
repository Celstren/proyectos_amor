import 'package:app_ui/app_constants/colors_constant.dart';
import 'package:app_ui/app_constants/size_constants.dart';
import 'package:app_ui/app_text/app_text.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:proyectos_amor/features/notifications/notifications_strings.dart';

class NotificationsHeader extends StatelessWidget {
  const NotificationsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: SizeConstants.md,
        horizontal: SizeConstants.xl,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: AutoRouter.of(context).maybePop,
            behavior: HitTestBehavior.opaque,
            child: const Icon(
              Icons.arrow_back,
              color: ColorsConstant.text950,
              size: 24,
            ),
          ),
          const SizedBox(width: SizeConstants.md),
          const AppText.semiBold(
            NotificationsStrings.notificationsHeaderTitle,
            fontSize: 20,
            fontColor: ColorsConstant.text950,
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }
}
