import 'package:app_ui/app_constants/colors_constant.dart';
import 'package:app_ui/app_constants/size_constants.dart';
import 'package:app_ui/app_image/app_icon.dart';
import 'package:app_ui/app_image/app_image.dart';
import 'package:app_ui/app_text/app_rich_text.dart';
import 'package:app_ui/app_text/app_text.dart';
import 'package:flutter/material.dart';
import 'package:proyectos_amor/features/create_account/create_account_images.dart';
import 'package:proyectos_amor/features/create_account/create_account_strings.dart';
import 'package:proyectos_amor/features/create_account/logic_holders/cubit/change_create_account_step_cubit/change_create_account_step_cubit.dart';
import 'package:proyectos_amor/features/create_account/presentation/content/create_account_bottom/create_account_bottom.dart';

class CreateAccountPicture extends StatelessWidget {
  final ChangeCreateAccountStepCubit changeCreateAccountStepCubit;
  const CreateAccountPicture({
    super.key,
    required this.changeCreateAccountStepCubit,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: SizeConstants.xl + MediaQuery.of(context).viewPadding.top,
        left: SizeConstants.xl,
        right: SizeConstants.xl,
        bottom: SizeConstants.xl,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const AppRichText(
            primaryText: CreateAccountStrings.createAccountPictureTitle1,
            primaryFontColor: ColorsConstant.splashPrimaryFontColor,
            primaryFontSize: 24,
            primaryFontWeight: FontWeight.w700,
            secondaryText: ' ${CreateAccountStrings.createAccountPictureTitle2}',
            secondaryFontColor: ColorsConstant.splashSecondaryFontColor,
            secondaryFontSize: 24,
            secondaryFontWeight: FontWeight.w700,
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: SizeConstants.xl),
          const AppText.normal(
            CreateAccountStrings.createAccountPictureSubTitle,
            fontColor: ColorsConstant.text950,
            fontSize: 12,
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: 56),
          const Center(
            child: SizedBox(
              height: 240,
              width: 240,
              child: Stack(
                children: <Widget>[
                  Center(
                    child: AppImage.assetSvg(
                      asset: CreateAccountImages.createAccountProfileCircle,
                      color: ColorsConstant.text400,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Center(
                    child: AppIcon.cameraPlusIcon(
                      size: 24,
                      color: ColorsConstant.text400,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewPadding.bottom,
            ),
            child: CreateAccountBottom(
              onBack: () => changeCreateAccountStepCubit.change(CreateAccountStep.about),
              onLater: () => changeCreateAccountStepCubit.change(CreateAccountStep.personal),
            ),
          ),
        ],
      ),
    );
  }
}
