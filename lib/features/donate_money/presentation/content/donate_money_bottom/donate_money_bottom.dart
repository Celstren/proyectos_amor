import 'package:app_ui/app_button/app_button.dart';
import 'package:app_ui/app_constants/colors_constant.dart';
import 'package:app_ui/app_text/app_text.dart';
import 'package:flutter/material.dart';
import 'package:proyectos_amor/features/donate_money/donate_money_strings.dart';

class DonateMoneyBottom extends StatelessWidget {
  final VoidCallback? onNext;
  final VoidCallback? onDone;
  const DonateMoneyBottom({super.key, this.onNext, this.onDone});

  @override
  Widget build(BuildContext context) {
    if (onNext != null) {
      return Padding(
        padding: const EdgeInsets.all(16),
        child: GestureDetector(
          onTap: onNext,
          behavior: HitTestBehavior.opaque,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const AppText.bold(
                DonateMoneyStrings.donateMoneyBottomNext,
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
      );
    }
    if (onDone != null) {
      return Padding(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          width: 180,
          child: AppButton(
            text: DonateMoneyStrings.donateMoneyBottomConfirm,
            onTap: onDone,
            radius: 50,
            color: ColorsConstant.primaryColor,
          ),
        ),
      );
    }
    return const SizedBox();
  }
}
