import 'package:app_ui/app_constants/colors_constant.dart';
import 'package:app_ui/app_constants/size_constants.dart';
import 'package:app_ui/app_text/app_rich_text.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:proyectos_amor/features/login/login_strings.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: AutoRouter.of(context).maybePop,
      behavior: HitTestBehavior.opaque,
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.arrow_back,
            color: ColorsConstant.text950,
            size: 24,
          ),
          SizedBox(width: SizeConstants.md),
          Expanded(
            child: AppRichText(
              primaryText: LoginStrings.loginContentTitle1,
              primaryFontSize: 24,
              primaryFontColor: ColorsConstant.text950,
              secondaryText: ' ${LoginStrings.loginContentTitle2}',
              secondaryFontSize: 24,
              secondaryFontColor: ColorsConstant.secondaryFontColor,
            ),
          ),
        ],
      ),
    );
  }
}
