import 'package:app_ui/app_constants/colors_constant.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:proyectos_amor/features/home/presentation/content/home_header/home_user_token.dart';
import 'package:app_ui/app_image/app_icon.dart';
import 'package:proyectos_amor/router/app_router.gr.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const HomeUserToken(),
        GestureDetector(
          onTap: () => AutoRouter.of(context).push(const NotificationsPageRoute()),
          child: const AppIcon.bellIcon(
            size: 24,
            color: ColorsConstant.neutralBlack,
          ),
        ),
      ],
    );
  }
}
