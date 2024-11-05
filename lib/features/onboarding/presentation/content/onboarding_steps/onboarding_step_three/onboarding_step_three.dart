import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:proyectos_amor/features/onboarding/logic_holders/cubits/change_onboarding_step_cubit/change_onboarding_step_cubit.dart';
import 'package:proyectos_amor/features/onboarding/onboarding_images.dart';
import 'package:proyectos_amor/features/onboarding/onboarding_strings.dart';
import 'package:proyectos_amor/features/onboarding/presentation/content/onboarding_bottom/onboarding_bottom.dart';
import 'package:proyectos_amor/features/onboarding/presentation/content/onboarding_header/onboarding_header.dart';
import 'package:proyectos_amor/features/onboarding/presentation/content/onboarding_steps/onboarding_step_three/onboarding_chip.dart';
import 'package:proyectos_amor/router/app_router.gr.dart';

class OnboardingStepThree extends StatefulWidget {
  final ChangeOnboardingStepCubit changeOnboardingStepCubit;
  const OnboardingStepThree({super.key, required this.changeOnboardingStepCubit});

  @override
  State<OnboardingStepThree> createState() => _OnboardingStepThreeState();
}

class _OnboardingStepThreeState extends State<OnboardingStepThree> with TickerProviderStateMixin {
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
          const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                OnboardingChip.yellow(text: '+12k voluntarios'),
                OnboardingChip.black(text: '+22 iniciativas'),
              ],
            ),
          ),
          const SizedBox(height: 15),
          const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                OnboardingChip.black(text: '+102 programas'),
                OnboardingChip.yellow(text: '+49 familias beneficiadas'),
              ],
            ),
          ),
          const SizedBox(height: 15),
          const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                OnboardingChip.yellow(text: '+200 sueños cumplidos'),
                OnboardingChip.black(text: '+17k almuerzos entregados'),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const Spacer(),
          OnboardingBottom(
            onBack: () => widget.changeOnboardingStepCubit.change(1),
            onFinish: () => AutoRouter.of(context).replaceAll([ const DashboardPageRoute() ]),
          ),
        ],
      ),
    );
  }
}
