import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyectos_amor/features/onboarding/logic_holders/cubits/change_onboarding_step_cubit/change_onboarding_step_cubit.dart';
import 'package:proyectos_amor/features/onboarding/presentation/content/onboarding_steps/onboarding_step_one/onboarding_step_one.dart';
import 'package:proyectos_amor/features/onboarding/presentation/content/onboarding_steps/onboarding_step_three/onboarding_step_three.dart';
import 'package:proyectos_amor/features/onboarding/presentation/content/onboarding_steps/onboarding_step_two/onboarding_step_two.dart';

class OnboardingContent extends StatefulWidget {
  const OnboardingContent({super.key});

  @override
  State<OnboardingContent> createState() => _OnboardingContentState();
}

class _OnboardingContentState extends State<OnboardingContent> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangeOnboardingStepCubit, int>(
      builder: (context, int stepIndexState) {
        if (stepIndexState == 0) return const OnboardingStepOne();
        if (stepIndexState == 1) return const OnboardingStepTwo();
        if (stepIndexState == 2) return const OnboardingStepThree();
        return const SizedBox();
      },
    );
  }
}
