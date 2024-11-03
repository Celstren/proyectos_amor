import 'package:app_ui/app_constants/colors_constant.dart';
import 'package:app_ui/app_text/app_text.dart';
import 'package:app_ui/app_button/app_button.dart';
import 'package:flutter/material.dart';
import 'package:proyectos_amor/features/onboarding/onboarding_strings.dart';

class OnboardingBottom extends StatelessWidget {
  final VoidCallback? onBack;
  final VoidCallback? onNext;
  final VoidCallback? onFinish;
  const OnboardingBottom({
    super.key,
    this.onBack,
    this.onNext,
    this.onFinish,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        if (onBack != null)
          GestureDetector(
            onTap: onBack,
            behavior: HitTestBehavior.opaque,
            child: const AppText.bold(
              OnboardingStrings.onboardingBackButton,
              fontSize: 16,
              fontColor: ColorsConstant.splashButtonPrimaryFontColor,
              textAlign: TextAlign.start,
            ),
          ),
        if (onNext != null)
          ...[
            const Spacer(),
            GestureDetector(
              onTap: onNext,
              behavior: HitTestBehavior.opaque,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const AppText.bold(
                    OnboardingStrings.onboardingNextButton,
                    fontSize: 16,
                    fontColor: ColorsConstant.splashButtonPrimaryFontColor,
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(width: 22),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorsConstant.primaryColor,
                    ),
                    child: const Icon(
                      Icons.chevron_right,
                      size: 24,
                      color: ColorsConstant.neutralWhite,
                    ),
                  ),
                ],
              ),
            ),
          ],
        if (onFinish != null)
          ...[
            const Spacer(),
            SizedBox(
              width: 180,
              child: AppButton(
                text: OnboardingStrings.onboardingFinishButton,
                onTap: onFinish,
                radius: 50,
                color: ColorsConstant.primaryColor,
              ),
            ),
          ],
      ],
    );
  }
}
