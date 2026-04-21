import 'package:app_ui/app_constants/colors_constant.dart';
import 'package:app_ui/app_constants/size_constants.dart';
import 'package:app_ui/app_text/app_rich_text.dart';
import 'package:app_ui/app_text/app_text.dart';
import 'package:app_ui/app_text_field/app_password_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyectos_amor/features/create_account/create_account_strings.dart';
import 'package:proyectos_amor/features/create_account/logic/bloc/profile_picture_bloc/profile_picture_bloc.dart';
import 'package:proyectos_amor/features/create_account/logic/bloc/sign_up_bloc/sign_up_bloc.dart';
import 'package:proyectos_amor/features/create_account/logic/cubit/change_about_cubit/change_about_cubit.dart';
import 'package:proyectos_amor/features/create_account/logic/cubit/change_create_account_cubit/change_create_account_step_cubit.dart';
import 'package:proyectos_amor/features/create_account/logic/cubit/password_validation_cubit.dart';
import 'package:proyectos_amor/features/create_account/logic/cubit/password_visibility_cubit.dart';
import 'package:proyectos_amor/features/create_account/presentation/content/create_account_bottom/create_account_bottom.dart';
import 'package:proyectos_amor/features/create_account/presentation/content/create_account_password/create_account_password_check.dart';

class CreateAccountPassword extends StatelessWidget {
  const CreateAccountPassword({super.key});

  void _onSignUp(BuildContext context) {
    final validationState = context.read<PasswordValidationCubit>().state;

    if (!validationState.isValid) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Por favor completa los requerimientos de contraseña'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    final signUpBloc = context.read<SignUpBloc>();
    final accountType = context.read<ChangeAboutCubit>().state;
    final pictureState = context.read<ProfilePictureBloc>().state;

    signUpBloc.add(
      SignUp(
        accountType: accountType?.name ?? 'person',
        profileImage: pictureState.maybeWhen(
          success: (file) => file,
          orElse: () => null,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpBloc, SignUpState>(
      listener: (context, state) {
        state.maybeWhen(
          signUpSuccessState: (imageUploadFailed) {
            if (imageUploadFailed) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content:
                      Text('Cuenta creada, pero no pudimos subir tu foto.'),
                  backgroundColor: Colors.orange,
                ),
              );
            }
            context
                .read<ChangeCreateAccountStepCubit>()
                .change(CreateAccountStep.completed);
          },
          signUpErrorState: (message, errorCode, statusCode) =>
              ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(message),
              backgroundColor: Colors.red,
            ),
          ),
          orElse: () {},
        );
      },
      child: BlocBuilder<SignUpBloc, SignUpState>(
        builder: (context, signUpState) {
          final isSignUpLoading = signUpState is SignUpLoadingState;

          return Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top:
                      SizeConstants.xl + MediaQuery.of(context).viewPadding.top,
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
                      primaryText:
                          CreateAccountStrings.createAccountPasswordTitle1,
                      primaryFontColor: ColorsConstant.splashPrimaryFontColor,
                      primaryFontSize: 24,
                      primaryFontWeight: FontWeight.w700,
                      secondaryText:
                          ' ${CreateAccountStrings.createAccountPasswordTitle2}',
                      secondaryFontColor:
                          ColorsConstant.splashSecondaryFontColor,
                      secondaryFontSize: 24,
                      secondaryFontWeight: FontWeight.w700,
                      ternaryText:
                          ' ${CreateAccountStrings.createAccountPasswordTitle3}',
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
                    BlocBuilder<PasswordVisibilityCubit, bool>(
                      builder: (context, isObscured) {
                        final signUpBloc = context.read<SignUpBloc>();
                        return AppPasswordTextField(
                          controller: signUpBloc.passwordController,
                          label:
                              CreateAccountStrings.createAccountPasswordLabel,
                          hint: CreateAccountStrings.createAccountPasswordHint,
                          obscured: isObscured,
                          onObscureTap: () =>
                              context.read<PasswordVisibilityCubit>().toggle(),
                          onChanged: (value) =>
                              context.read<PasswordValidationCubit>().validate(
                                    value,
                                    signUpBloc.confirmPassword,
                                  ),
                        );
                      },
                    ),
                    const SizedBox(height: SizeConstants.xl),
                    BlocBuilder<PasswordValidationCubit,
                        PasswordValidationState>(
                      builder: (context, state) {
                        return Column(
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  child: CreateAccountPasswordCheck(
                                    label: CreateAccountStrings
                                        .createAccountPasswordCheck1,
                                    checked: state.hasMinMaxChars,
                                  ),
                                ),
                                Expanded(
                                  child: CreateAccountPasswordCheck(
                                    label: CreateAccountStrings
                                        .createAccountPasswordCheck2,
                                    checked: state.hasLowercase,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: SizeConstants.xl),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  child: CreateAccountPasswordCheck(
                                    label: CreateAccountStrings
                                        .createAccountPasswordCheck3,
                                    checked: state.hasNumber,
                                  ),
                                ),
                                Expanded(
                                  child: CreateAccountPasswordCheck(
                                    label: CreateAccountStrings
                                        .createAccountPasswordCheck4,
                                    checked: state.hasUppercase,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: SizeConstants.xl),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  child: CreateAccountPasswordCheck(
                                    label: CreateAccountStrings
                                        .createAccountPasswordCheck5,
                                    checked: state.hasSpecialChar,
                                  ),
                                ),
                                const Spacer(),
                              ],
                            ),
                          ],
                        );
                      },
                    ),
                    const SizedBox(height: SizeConstants.xl),
                    BlocBuilder<PasswordVisibilityCubit, bool>(
                      builder: (context, isObscured) {
                        final signUpBloc = context.read<SignUpBloc>();
                        return AppPasswordTextField(
                          controller: signUpBloc.confirmPasswordController,
                          label: CreateAccountStrings
                              .createAccountConfirmPasswordLabel,
                          hint: CreateAccountStrings
                              .createAccountConfirmPasswordHint,
                          obscured: isObscured,
                          onObscureTap: () =>
                              context.read<PasswordVisibilityCubit>().toggle(),
                          onChanged: (value) =>
                              context.read<PasswordValidationCubit>().validate(
                                    signUpBloc.password,
                                    value,
                                  ),
                        );
                      },
                    ),
                    const Spacer(),
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewPadding.bottom,
                      ),
                      child: CreateAccountBottom(
                        onBack: () => context
                            .read<ChangeCreateAccountStepCubit>()
                            .change(CreateAccountStep.picture),
                        onNext:
                            isSignUpLoading ? null : () => _onSignUp(context),
                      ),
                    ),
                  ],
                ),
              ),
              if (isSignUpLoading)
                Container(
                  color: Colors.black26,
                  child: const Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircularProgressIndicator(
                          color: ColorsConstant.splashSecondaryFontColor,
                        ),
                        SizedBox(height: 16),
                        AppText.medium(
                          'Creando tu cuenta...',
                          fontColor: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
