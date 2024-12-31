import 'package:app_ui/app_button/app_button.dart';
import 'package:app_ui/app_constants/colors_constant.dart';
import 'package:app_ui/app_text/app_text.dart';
import 'package:flutter/material.dart';
import 'package:proyectos_amor/features/delete_account/delete_account_strings.dart';

class DeleteAccountBottom extends StatelessWidget {
  final bool confirmed;
  final VoidCallback onContinue;
  const DeleteAccountBottom({
    super.key,
    this.confirmed = false,
    required this.onContinue,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18),
      child: confirmed ? AppButton.solid(
        text: DeleteAccountStrings.deleteAccountBottomPrimaryButton,
        radius: 56,
        onTap: () {},
      ) : Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: onContinue,
            behavior: HitTestBehavior.opaque,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const AppText.bold(
                  DeleteAccountStrings.deleteAccountBottomSecondaryButton,
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
          )
        ],
      ),
    );
  }
}
