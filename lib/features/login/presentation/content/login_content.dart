import 'package:app_ui/app_button/app_button.dart';
import 'package:app_ui/app_constants/colors_constant.dart';
import 'package:app_ui/app_constants/size_constants.dart';
import 'package:app_ui/app_scaffold/app_scaffold.dart';
import 'package:app_ui/app_text/app_text.dart';
import 'package:app_ui/app_text_field/app_labeled_text_field.dart';
import 'package:app_ui/app_text_field/app_password_text_field.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyectos_amor/features/login/logic/bloc/login_bloc/login_bloc.dart';
import 'package:proyectos_amor/features/login/logic/cubit/obscure_text_cubit.dart';
import 'package:proyectos_amor/features/login/login_strings.dart';
import 'package:proyectos_amor/features/login/presentation/content/login_header/login_header.dart';
import 'package:proyectos_amor/router/app_router.gr.dart';

class LoginContent extends StatefulWidget {
  const LoginContent({super.key});

  @override
  State<LoginContent> createState() => _LoginContentState();
}

class _LoginContentState extends State<LoginContent> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ObscureTextCubit()),
      ],
      child: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          state.maybeWhen(
            loginSuccessState: () => context.router.replace(const HomePageRoute()),
            loginErrorState: (message) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(message.isNotEmpty ? message : 'Ocurrió un error inesperado'),
                  backgroundColor: Colors.red,
                ),
              );
            },
            loginConnectionErrorState: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Error de conexión. Revisa tu internet.'),
                  backgroundColor: Colors.orange,
                ),
              );
            },
            loginUnauthorizedState: () {
               ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Credenciales incorrectas.'),
                  backgroundColor: Colors.red,
                ),
              );
            },
            orElse: () {},
          );
        },
        child: AppScaffold(
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(SizeConstants.xl),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const LoginHeader(),
                const SizedBox(height: 56),
                AppLabeledTextField(
                  controller: context.read<LoginBloc>().emailController,
                  label: LoginStrings.loginContentEmailLabel,
                  hint: LoginStrings.loginContentEmailHint,
                ),
                const SizedBox(height: SizeConstants.md),
                BlocBuilder<ObscureTextCubit, bool>(
                  builder: (context, isObscured) {
                    return AppPasswordTextField(
                      controller: context.read<LoginBloc>().passwordController,
                      label: LoginStrings.loginContentPasswordLabel,
                      hint: LoginStrings.loginContentPasswordHint,
                      obscured: isObscured,
                      onObscureTap: () => context.read<ObscureTextCubit>().toggle(),
                    );
                  },
                ),
                const SizedBox(height: SizeConstants.xl),
                GestureDetector(
                  onTap: () => AutoRouter.of(context).push(const ForgotPasswordPageRoute()),
                  behavior: HitTestBehavior.opaque,
                  child: const AppText.normal(
                    LoginStrings.loginContentForgotAccountLabel,
                    fontColor: ColorsConstant.text950,
                    fontSize: 16,
                    textAlign: TextAlign.end,
                  ),
                ),
                const SizedBox(height: SizeConstants.xl),
                BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    final isLoading = state is LoginLoadingState;
                    return AppButton.solid(
                      onTap: isLoading ? null : () => context.read<LoginBloc>().add(const Login()),
                      text: isLoading ? 'Iniciando sesión...' : LoginStrings.loginContentPrimaryButton,
                    );
                  },
                ),
                const SizedBox(height: SizeConstants.xl),
                AppButton.link(
                  onTap: () => AutoRouter.of(context).push(const CreateAccountPageRoute()),
                  text: LoginStrings.loginContentSecondaryButton,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
