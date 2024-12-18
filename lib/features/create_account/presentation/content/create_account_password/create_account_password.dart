import 'package:app_ui/app_constants/colors_constant.dart';
import 'package:app_ui/app_constants/size_constants.dart';
import 'package:app_ui/app_text/app_rich_text.dart';
import 'package:app_ui/app_text/app_text.dart';
import 'package:app_ui/app_text_field/app_password_text_field.dart';
import 'package:flutter/material.dart';
import 'package:proyectos_amor/features/create_account/create_account_strings.dart';
import 'package:proyectos_amor/features/create_account/logic_holders/cubit/change_create_account_step_cubit/change_create_account_step_cubit.dart';
import 'package:proyectos_amor/features/create_account/presentation/content/create_account_bottom/create_account_bottom.dart';
import 'package:proyectos_amor/features/create_account/presentation/content/create_account_password/create_account_password_check.dart';

class CreateAccountPassword extends StatelessWidget {
  final ChangeCreateAccountStepCubit changeCreateAccountStepCubit;
  const CreateAccountPassword({super.key, required this.changeCreateAccountStepCubit});

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
            primaryText: CreateAccountStrings.createAccountPasswordTitle1,
            primaryFontColor: ColorsConstant.splashPrimaryFontColor,
            primaryFontSize: 24,
            primaryFontWeight: FontWeight.w700,
            secondaryText: ' ${CreateAccountStrings.createAccountPasswordTitle2}',
            secondaryFontColor: ColorsConstant.splashSecondaryFontColor,
            secondaryFontSize: 24,
            secondaryFontWeight: FontWeight.w700,
            ternaryText: ' ${CreateAccountStrings.createAccountPasswordTitle3}',
            ternaryFontColor: ColorsConstant.splashPrimaryFontColor,
            ternaryFontSize: 24,
            ternaryFontWeight: FontWeight.w700,
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: SizeConstants.xl),
          const AppText.normal(
            CreateAccountStrings.createAccountPasswordSubTitle,
            fontColor: ColorsConstant.text950,
            fontSize: 12,
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: SizeConstants.xl),
          const AppPasswordTextField(
            label: CreateAccountStrings.createAccountPasswordLabel,
            hint: CreateAccountStrings.createAccountPasswordHint,
          ),
          const SizedBox(height: SizeConstants.xl),
          const Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: CreateAccountPasswordCheck(
                  label: CreateAccountStrings.createAccountPasswordCheck1,
                  checked: true,
                ),
              ),
              Expanded(
                child: CreateAccountPasswordCheck(
                  label: CreateAccountStrings.createAccountPasswordCheck2,
                  checked: false,
                ),
              ),
            ],
          ),
          const SizedBox(height: SizeConstants.xl),
          const Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: CreateAccountPasswordCheck(
                  label: CreateAccountStrings.createAccountPasswordCheck3,
                  checked: true,
                ),
              ),
              Expanded(
                child: CreateAccountPasswordCheck(
                  label: CreateAccountStrings.createAccountPasswordCheck4,
                  checked: false,
                ),
              ),
            ],
          ),
          const SizedBox(height: SizeConstants.xl),
          const AppPasswordTextField(
            label: CreateAccountStrings.createAccountConfirmPasswordLabel,
            hint: CreateAccountStrings.createAccountConfirmPasswordHint,
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewPadding.bottom,
            ),
            child: CreateAccountBottom(
              onBack: () => changeCreateAccountStepCubit.change(CreateAccountStep.picture),
              onNext: () => changeCreateAccountStepCubit.change(CreateAccountStep.completed),
            ),
          ),
        ],
      ),
    );
  }
}
