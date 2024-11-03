import 'package:app_ui/app_constants/colors_constant.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:proyectos_amor/features/onboarding/logic_holders/cubits/change_onboarding_step_cubit/change_onboarding_step_cubit.dart';
import 'package:proyectos_amor/features/onboarding/onboarding_images.dart';
import 'package:proyectos_amor/features/onboarding/onboarding_strings.dart';
import 'package:proyectos_amor/features/onboarding/presentation/content/onboarding_bottom/onboarding_bottom.dart';
import 'package:proyectos_amor/features/onboarding/presentation/content/onboarding_header/onboarding_header.dart';

class OnboardingStepTwo extends StatefulWidget {
  final ChangeOnboardingStepCubit changeOnboardingStepCubit;
  const OnboardingStepTwo({super.key, required this.changeOnboardingStepCubit});

  @override
  State<OnboardingStepTwo> createState() => _OnboardingStepTwoState();
}

class _OnboardingStepTwoState extends State<OnboardingStepTwo> {
  final carouselSliderController = CarouselSliderController();
  var sliderIndex = 0;

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
            asset: OnboardingImages.splashImageTwo,
            title1: OnboardingStrings.splashTwoTitle1,
            title2: OnboardingStrings.splashTwoTitle2,
            subTitle: OnboardingStrings.splashTwoSubTitle,
          ),
          const SizedBox(height: 50),
          CarouselSlider(
            carouselController: carouselSliderController,
            items: const <Widget>[
              SizedBox(width: 324, child: Placeholder()),
              SizedBox(width: 324, child: Placeholder()),
              SizedBox(width: 324, child: Placeholder()),
            ],
            options: CarouselOptions(
              height: 160,
              viewportFraction: 1,
              enableInfiniteScroll: true,
              onPageChanged: (index, reason) {
                setState(() {
                  sliderIndex = index;
                });
              },
            ),
          ),
          const SizedBox(height: 17),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              3,
                  (index) => Container(
                width: 8,
                height: 8,
                margin: index != 0 ? const EdgeInsets.only(left: 8) : null,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: sliderIndex == index
                      ? ColorsConstant.sliderPrimaryColor
                      : ColorsConstant.sliderSecondaryColor,
                ),
              ),
            ),
          ),
          const Spacer(),
          OnboardingBottom(
            onBack: () => widget.changeOnboardingStepCubit.change(0),
            onNext: () => widget.changeOnboardingStepCubit.change(2),
          ),
        ],
      ),
    );
  }
}
