import 'package:app_ui/app_scaffold/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyectos_amor/features/create_account/logic_holders/cubit/change_about_cubit/change_about_cubit.dart';
import 'package:proyectos_amor/features/create_account/logic_holders/cubit/change_create_account_step_cubit/change_create_account_step_cubit.dart';
import 'package:proyectos_amor/features/create_account/presentation/content/create_account_about/create_account_about.dart';
import 'package:proyectos_amor/features/create_account/presentation/content/create_account_completed/create_account_completed.dart';
import 'package:proyectos_amor/features/create_account/presentation/content/create_account_password/create_account_password.dart';
import 'package:proyectos_amor/features/create_account/presentation/content/create_account_personal/create_account_personal.dart';
import 'package:proyectos_amor/features/create_account/presentation/content/create_account_picture/create_account_picture.dart';
import 'package:proyectos_amor/injection.dart';

class CreateAccountContent extends StatefulWidget {

  const CreateAccountContent({super.key});

  @override
  State<CreateAccountContent> createState() => _CreateAccountContentState();
}

class _CreateAccountContentState extends State<CreateAccountContent> {
  final changeCreateAccountStepCubit = getIt<ChangeCreateAccountStepCubit>();
  final changeAboutCubit = getIt<ChangeAboutCubit>();

  @override
  void dispose() {
    changeCreateAccountStepCubit.close();
    changeAboutCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      safeTop: false,
      body: BlocBuilder(
        bloc: changeCreateAccountStepCubit,
        builder: (context, CreateAccountStep stepState) {
          switch(stepState) {
            case CreateAccountStep.about:
              return CreateAccountAbout(
                changeCreateAccountStepCubit: changeCreateAccountStepCubit,
                changeAboutCubit: changeAboutCubit,
              );
            case CreateAccountStep.picture:
              return CreateAccountPicture(
                changeCreateAccountStepCubit: changeCreateAccountStepCubit,
              );
            case CreateAccountStep.personal:
              return CreateAccountPersonal(
                changeCreateAccountStepCubit: changeCreateAccountStepCubit,
              );
            case CreateAccountStep.password:
              return CreateAccountPassword(
                changeCreateAccountStepCubit: changeCreateAccountStepCubit,
              );
            case CreateAccountStep.completed:
              return CreateAccountCompleted(
                changeCreateAccountStepCubit: changeCreateAccountStepCubit,
              );
          }
        },
      ),
    );
  }
}
