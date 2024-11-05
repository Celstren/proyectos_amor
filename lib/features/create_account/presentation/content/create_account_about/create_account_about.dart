import 'package:app_ui/app_constants/colors_constant.dart';
import 'package:app_ui/app_constants/size_constants.dart';
import 'package:app_ui/app_text/app_rich_text.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyectos_amor/features/create_account/create_account_images.dart';
import 'package:proyectos_amor/features/create_account/create_account_strings.dart';
import 'package:proyectos_amor/features/create_account/logic_holders/cubit/change_about_cubit/change_about_cubit.dart';
import 'package:proyectos_amor/features/create_account/logic_holders/cubit/change_create_account_step_cubit/change_create_account_step_cubit.dart';
import 'package:proyectos_amor/features/create_account/presentation/content/create_account_about/create_account_about_option/create_account_about_option.dart';
import 'package:proyectos_amor/features/create_account/presentation/content/create_account_bottom/create_account_bottom.dart';

class CreateAccountAbout extends StatelessWidget {
  final ChangeCreateAccountStepCubit changeCreateAccountStepCubit;
  final ChangeAboutCubit changeAboutCubit;
  const CreateAccountAbout({
    super.key,
    required this.changeCreateAccountStepCubit,
    required this.changeAboutCubit,
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
            primaryText: CreateAccountStrings.createAccountAboutTitle1,
            primaryFontColor: ColorsConstant.splashPrimaryFontColor,
            primaryFontSize: 24,
            primaryFontWeight: FontWeight.w700,
            secondaryText: ' ${CreateAccountStrings.createAccountAboutTitle2}',
            secondaryFontColor: ColorsConstant.splashSecondaryFontColor,
            secondaryFontSize: 24,
            secondaryFontWeight: FontWeight.w700,
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: SizeConstants.xl),
          BlocBuilder(
            bloc: changeAboutCubit,
            builder: (context, AboutEnum? aboutState) => Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                CreateAccountAboutOption(
                  onTap: () => changeAboutCubit.change(AboutEnum.person),
                  text: CreateAccountStrings.createAccountAboutOptionTitle1,
                  description: CreateAccountStrings.createAccountAboutOptionDescription1,
                  asset: CreateAccountImages.createAccountSpadesIcon,
                  selected: aboutState == AboutEnum.person,
                ),
                const SizedBox(height: SizeConstants.xl),
                CreateAccountAboutOption(
                  onTap: () => changeAboutCubit.change(AboutEnum.school),
                  text: CreateAccountStrings.createAccountAboutOptionTitle2,
                  description: CreateAccountStrings.createAccountAboutOptionDescription2,
                  asset: CreateAccountImages.createAccountStarIcon,
                  selected: aboutState == AboutEnum.school,
                ),
                const SizedBox(height: SizeConstants.xl),
                CreateAccountAboutOption(
                  onTap: () => changeAboutCubit.change(AboutEnum.company),
                  text: CreateAccountStrings.createAccountAboutOptionTitle3,
                  description: CreateAccountStrings.createAccountAboutOptionDescription3,
                  asset: CreateAccountImages.createAccountHearthIcon,
                  selected: aboutState == AboutEnum.company,
                ),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewPadding.bottom,
            ),
            child: CreateAccountBottom(
              onBack: AutoRouter.of(context).maybePop,
              onNext: () => changeCreateAccountStepCubit.change(CreateAccountStep.picture),
            ),
          ),
        ],
      ),
    );
  }
}
