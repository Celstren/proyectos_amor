import 'package:app_ui/app_constants/colors_constant.dart';
import 'package:app_ui/app_scaffold/app_scaffold.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyectos_amor/features/onboarding/logic_holders/cubits/change_onboarding_step_cubit/change_onboarding_step_cubit.dart';
import 'package:proyectos_amor/features/onboarding/presentation/content/onboarding_content.dart';

@RoutePage(name: 'OnboardingPageRoute')
class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: <BlocProvider>[
        BlocProvider<ChangeOnboardingStepCubit>(create: (_) => ChangeOnboardingStepCubit()),
      ],
      child: const AppScaffold(
        backgroundColor: ColorsConstant.scaffoldBackground,
        body: OnboardingContent(),
      ),
    );
  }
}
