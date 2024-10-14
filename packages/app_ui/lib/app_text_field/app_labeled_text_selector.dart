import 'package:app_ui/app_constants/colors_constant.dart';
import 'package:app_ui/app_image/app_icon.dart';
import 'package:app_ui/app_text/app_text.dart';
import 'package:app_ui/app_text_field/app_text_field.dart';
import 'package:flutter/material.dart';

class AppLabeledTextSelector extends StatelessWidget {
  final String label;
  final String hint;
  final String error;
  final bool enabled;
  final VoidCallback onTap;
  const AppLabeledTextSelector({
    super.key,
    this.label = '',
    this.hint = '',
    this.error = '',
    this.enabled = true,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        AppText.medium(
          label,
          textAlign: TextAlign.left,
          fontSize: 16,
          fontColor: enabled ? ColorsConstant.skyBlue950 : ColorsConstant.text200,
        ),
        const SizedBox(height: 8),
        AppTextField(
          controller: TextEditingController(),
          borderColor: ColorsConstant.text100,
          highlightBorderColor: ColorsConstant.skyBlue600,
          hint: hint,
          enabled: enabled,
          readOnly: true,
          onTap: onTap,
          suffix: SizedBox(
            width: 24,
            child: Center(
              child: Transform.flip(
                flipX: true,
                child: const AppIcon.chevronLeftIcon(
                  size: 20,
                  color: ColorsConstant.text400,
                ),
              ),
            ),
          ),
        ),
        if (error.isNotEmpty)
          ...[
            const SizedBox(height: 8),
            AppText.normal(
              error,
              textAlign: TextAlign.left,
              fontSize: 14,
              fontColor: enabled ? ColorsConstant.feedbackError500 : ColorsConstant.text200,
            ),
          ],
      ],
    );
  }
}
