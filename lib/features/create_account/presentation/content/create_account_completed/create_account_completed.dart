import 'package:app_ui/app_button/app_button.dart';
import 'package:app_ui/app_constants/colors_constant.dart';
import 'package:app_ui/app_constants/size_constants.dart';
import 'package:app_ui/app_image/app_image.dart';
import 'package:app_ui/app_text/app_rich_text.dart';
import 'package:app_ui/app_text/app_text.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:proyectos_amor/features/create_account/create_account_images.dart';
import 'package:proyectos_amor/features/create_account/create_account_strings.dart';
import 'package:proyectos_amor/router/app_router.gr.dart';

class CreateAccountCompleted extends StatelessWidget {
  const CreateAccountCompleted({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(SizeConstants.xl),
          decoration: const BoxDecoration(
            color: ColorsConstant.secondaryColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(SizeConstants.xl),
              bottomRight: Radius.circular(SizeConstants.xl),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: MediaQuery.of(context).viewPadding.top),
              const AppText.normal(
                CreateAccountStrings.createAccountCompletedSubTitle,
                fontColor: ColorsConstant.text950,
                fontSize: 12,
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: SizeConstants.lg),
              const AppRichText(
                primaryText: CreateAccountStrings.createAccountCompletedTitle1,
                primaryFontColor: ColorsConstant.splashPrimaryFontColor,
                primaryFontSize: 24,
                primaryFontWeight: FontWeight.w700,
                secondaryText:
                    ' ${CreateAccountStrings.createAccountCompletedTitle2}',
                secondaryFontColor: ColorsConstant.splashSecondaryFontColor,
                secondaryFontSize: 24,
                secondaryFontWeight: FontWeight.w700,
                ternaryText:
                    ' ${CreateAccountStrings.createAccountCompletedTitle3}',
                ternaryFontColor: ColorsConstant.splashPrimaryFontColor,
                ternaryFontSize: 24,
                ternaryFontWeight: FontWeight.w700,
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 28),
              const Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding:
                          EdgeInsets.only(top: SizeConstants.xs, right: 128),
                      child: AppImage.assetSvg(
                        height: 82,
                        asset: CreateAccountImages.createAccountCloudLeftIcon,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.only(left: 128),
                      child: AppImage.assetSvg(
                        height: 82,
                        asset: CreateAccountImages.createAccountCloudRightIcon,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 76),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(SizeConstants.xl),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const SizedBox(height: 36),
                const AppText.medium(
                  CreateAccountStrings.createAccountCompletedQuantityTitle,
                  fontColor: ColorsConstant.text950,
                  fontSize: 16,
                  textAlign: TextAlign.center,
                ),
                const AppText.bold(
                  '396,432',
                  fontColor: ColorsConstant.text950,
                  fontSize: 64,
                  textAlign: TextAlign.center,
                ),
                const AppRichText(
                  primaryText: CreateAccountStrings
                      .createAccountCompletedQuantitySubTitle1,
                  primaryFontColor: ColorsConstant.splashPrimaryFontColor,
                  primaryFontSize: 16,
                  primaryFontWeight: FontWeight.w500,
                  secondaryText:
                      ' ${CreateAccountStrings.createAccountCompletedQuantitySubTitle2}',
                  secondaryFontColor: ColorsConstant.splashSecondaryFontColor,
                  secondaryFontSize: 16,
                  secondaryFontWeight: FontWeight.w500,
                  textAlign: TextAlign.center,
                ),
                const Spacer(),
                AppButton.link(
                  text: CreateAccountStrings
                      .createAccountCompletedSecondaryButton,
                  onTap: () {},
                ),
                const SizedBox(height: SizeConstants.xl),
                AppButton.solid(
                  text:
                      CreateAccountStrings.createAccountCompletedPrimaryButton,
                  onTap: () => AutoRouter.of(context)
                      .replaceAll([const DashboardPageRoute()]),
                ),
                SizedBox(height: MediaQuery.of(context).viewPadding.bottom),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
