import 'package:app_ui/app_constants/colors_constant.dart';
import 'package:app_ui/app_constants/size_constants.dart';
import 'package:app_ui/app_text/app_text.dart';
import 'package:flutter/material.dart';
import 'package:proyectos_amor/features/profile/profile_strings.dart';

class UnauthorizedSocial extends StatelessWidget {
  const UnauthorizedSocial({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(SizeConstants.xl),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const AppText.semiBold(
            ProfileStrings.unauthorizedSocialTitle,
            fontSize: 14,
            fontColor: ColorsConstant.text950,
          ),
          const SizedBox(height: SizeConstants.xl),
          GestureDetector(
            onTap: () {},
            behavior: HitTestBehavior.opaque,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: SizeConstants.lg),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: ColorsConstant.text100,
                  ),
                ),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  AppText.normal(
                    ProfileStrings.unauthorizedSocialOption1,
                    fontSize: 16,
                    fontColor: ColorsConstant.text950,
                  ),
                  Icon(
                    Icons.chevron_right,
                    size: 24,
                    color: ColorsConstant.text950,
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            behavior: HitTestBehavior.opaque,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: SizeConstants.lg),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: ColorsConstant.text100,
                  ),
                ),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  AppText.normal(
                    ProfileStrings.unauthorizedSocialOption2,
                    fontSize: 16,
                    fontColor: ColorsConstant.text950,
                  ),
                  Icon(
                    Icons.chevron_right,
                    size: 24,
                    color: ColorsConstant.text950,
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            behavior: HitTestBehavior.opaque,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: SizeConstants.lg),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: ColorsConstant.text100,
                  ),
                ),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  AppText.normal(
                    ProfileStrings.unauthorizedSocialOption3,
                    fontSize: 16,
                    fontColor: ColorsConstant.text950,
                  ),
                  Icon(
                    Icons.chevron_right,
                    size: 24,
                    color: ColorsConstant.text950,
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            behavior: HitTestBehavior.opaque,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: SizeConstants.lg),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: ColorsConstant.text100,
                  ),
                ),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  AppText.normal(
                    ProfileStrings.unauthorizedSocialOption4,
                    fontSize: 16,
                    fontColor: ColorsConstant.text950,
                  ),
                  Icon(
                    Icons.chevron_right,
                    size: 24,
                    color: ColorsConstant.text950,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
