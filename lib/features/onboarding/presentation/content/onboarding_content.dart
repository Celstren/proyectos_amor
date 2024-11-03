import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyectos_amor/features/onboarding/logic_holders/cubits/change_onboarding_step_cubit/change_onboarding_step_cubit.dart';
import 'package:proyectos_amor/features/onboarding/presentation/content/onboarding_steps/onboarding_step_one/onboarding_step_one.dart';
import 'package:proyectos_amor/features/onboarding/presentation/content/onboarding_steps/onboarding_step_three/onboarding_step_three.dart';
import 'package:proyectos_amor/features/onboarding/presentation/content/onboarding_steps/onboarding_step_two/onboarding_step_two.dart';
import 'package:proyectos_amor/injection.dart';

class OnboardingContent extends StatefulWidget {
  const OnboardingContent({super.key});

  @override
  State<OnboardingContent> createState() => _OnboardingContentState();
}

class _OnboardingContentState extends State<OnboardingContent> {
  final changeOnboardingStepCubit = getIt<ChangeOnboardingStepCubit>();

  @override
  void dispose() {
    changeOnboardingStepCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: changeOnboardingStepCubit,
      builder: (context, int stepIndexState) {
        if (stepIndexState == 0) return OnboardingStepOne(changeOnboardingStepCubit: changeOnboardingStepCubit);
        if (stepIndexState == 1) return OnboardingStepTwo(changeOnboardingStepCubit: changeOnboardingStepCubit);
        if (stepIndexState == 2) return OnboardingStepThree(changeOnboardingStepCubit: changeOnboardingStepCubit);
        return const SizedBox();
      },
    );
  }
}
