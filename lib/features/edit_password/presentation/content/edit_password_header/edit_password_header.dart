import 'package:app_ui/app_constants/colors_constant.dart';
import 'package:app_ui/app_constants/size_constants.dart';
import 'package:app_ui/app_text/app_text.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:proyectos_amor/features/edit_password/edit_password_strings.dart';

class EditPasswordHeader extends StatelessWidget {
  const EditPasswordHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: AutoRouter.of(context).maybePop,
      behavior: HitTestBehavior.opaque,
      child: const Padding(
        padding: EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 18,
        ),
        child: Row(
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
              child: AppText.normal(
                EditPasswordStrings.editPasswordHeader,
                fontColor: ColorsConstant.splashPrimaryFontColor,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
