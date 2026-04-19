import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyectos_amor/features/create_account/logic/bloc/profile_picture_bloc/profile_picture_bloc.dart';
import 'package:proyectos_amor/features/create_account/logic/bloc/sign_up_bloc/sign_up_bloc.dart';
import 'package:proyectos_amor/features/create_account/logic/cubit/change_about_cubit/change_about_cubit.dart';
import 'package:proyectos_amor/features/create_account/logic/cubit/change_create_account_cubit/change_create_account_step_cubit.dart';
import 'package:proyectos_amor/features/create_account/logic/cubit/password_validation_cubit.dart';
import 'package:proyectos_amor/features/create_account/logic/cubit/password_visibility_cubit.dart';
import 'package:proyectos_amor/features/create_account/presentation/content/create_account_content.dart';
import 'package:proyectos_amor/injection.dart';

@RoutePage(name: 'CreateAccountPageRoute')
class CreateAccountPage extends StatelessWidget {
  const CreateAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: <BlocProvider>[
        BlocProvider<SignUpBloc>(create: (_) => getIt<SignUpBloc>()),
        BlocProvider<ProfilePictureBloc>(create: (_) => ProfilePictureBloc()),
        BlocProvider<ChangeCreateAccountStepCubit>(create: (_) => ChangeCreateAccountStepCubit()),
        BlocProvider<ChangeAboutCubit>(create: (_) => ChangeAboutCubit()),
        BlocProvider<PasswordVisibilityCubit>(create: (_) => PasswordVisibilityCubit()),
        BlocProvider<PasswordValidationCubit>(create: (_) => PasswordValidationCubit()),
      ],
      child: const CreateAccountContent(),
    );
  }
}
