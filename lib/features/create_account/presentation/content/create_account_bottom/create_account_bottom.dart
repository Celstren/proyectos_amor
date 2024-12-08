import 'package:app_ui/app_constants/colors_constant.dart';
import 'package:app_ui/app_text/app_text.dart';
import 'package:flutter/material.dart';
import 'package:proyectos_amor/features/create_account/create_account_strings.dart';

class CreateAccountBottom extends StatelessWidget {
  final VoidCallback? onBack;
  final VoidCallback? onNext;
  final VoidCallback? onLater;
  const CreateAccountBottom({super.key, this.onBack, this.onNext, this.onLater});

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
              CreateAccountStrings.createAccountBottomBackButton,
              fontSize: 16,
              fontColor: ColorsConstant.splashButtonPrimaryFontColor,
              textAlign: TextAlign.start,
            ),
          ),
        if (onLater != null) ...[
          const Spacer(),
          GestureDetector(
            onTap: onLater,
            behavior: HitTestBehavior.opaque,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const AppText.bold(
                  CreateAccountStrings.createAccountBottomLaterButton,
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
        if (onNext != null) ...[
          const Spacer(),
          GestureDetector(
            onTap: onNext,
            behavior: HitTestBehavior.opaque,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const AppText.bold(
                  CreateAccountStrings.createAccountBottomNextButton,
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
      ],
    );
  }
}
