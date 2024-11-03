import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:proyectos_amor/features/onboarding/logic_holders/cubits/change_onboarding_step_cubit/change_onboarding_step_cubit.dart';
import 'package:proyectos_amor/features/onboarding/onboarding_images.dart';
import 'package:proyectos_amor/features/onboarding/onboarding_strings.dart';
import 'package:proyectos_amor/features/onboarding/presentation/content/onboarding_bottom/onboarding_bottom.dart';
import 'package:proyectos_amor/features/onboarding/presentation/content/onboarding_header/onboarding_header.dart';
import 'package:proyectos_amor/router/app_router.gr.dart';

class OnboardingStepThree extends StatelessWidget {
  final ChangeOnboardingStepCubit changeOnboardingStepCubit;
  const OnboardingStepThree({super.key, required this.changeOnboardingStepCubit});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const SizedBox(height: 19),
          const OnboardingHeader(
            asset: OnboardingImages.splashImageThree,
            title1: OnboardingStrings.splashThreeTitle1,
            title2: OnboardingStrings.splashThreeTitle2,
            subTitle: OnboardingStrings.splashThreeSubTitle,
          ),
          const SizedBox(height: 50),
          const SizedBox(height: 42),
          const SizedBox(height: 15),
          const SizedBox(height: 42),
          const SizedBox(height: 15),
          const SizedBox(height: 42),
          const SizedBox(height: 24),
          const Spacer(),
          OnboardingBottom(
            onBack: () => changeOnboardingStepCubit.change(1),
            onFinish: () => AutoRouter.of(context).replaceAll([ const DashboardPageRoute() ]),
          ),
        ],
      ),
    );
  }
}
