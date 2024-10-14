import 'package:app_ui/app_constants/colors_constant.dart';
import 'package:app_ui/app_image/app_icon.dart';
import 'package:app_ui/app_text/app_text.dart';
import 'package:app_ui/app_text_field/app_text_field.dart';
import 'package:flutter/material.dart';

class AppPasswordTextField extends StatelessWidget {
  final String label;
  final String hint;
  final String error;
  final bool enabled;
  final TextEditingController? controller;
  final bool obscured;
  final TextInputType? textInputType;
  final Function(String)? onSubmitted;
  final Function(String)? onChanged;
  final VoidCallback? onObscureTap;
  const AppPasswordTextField({
    super.key,
    this.label = '',
    this.hint = '',
    this.error = '',
    this.enabled = true,
    this.controller,
    this.obscured = false,
    this.textInputType,
    this.onSubmitted,
    this.onChanged,
    this.onObscureTap,
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
          fontColor:
              enabled ? ColorsConstant.skyBlue950 : ColorsConstant.text200,
        ),
        const SizedBox(height: 8),
        AppTextField(
          controller: controller,
          borderColor: ColorsConstant.text100,
          highlightBorderColor: ColorsConstant.skyBlue600,
          hint: hint,
          obscureText: obscured,
          textInputType: textInputType ?? TextInputType.visiblePassword,
          onSubmitted: onSubmitted,
          onChanged: onChanged,
          enableSuggestions: false,
          autocorrect: false,
          suffix: GestureDetector(
            onTap: onObscureTap,
            behavior: HitTestBehavior.opaque,
            child: SizedBox(
              height: 24,
              width: 24,
              child: Center(
                child: obscured
                    ? const AppIcon.visibilityOnIcon(
                        color: ColorsConstant.text400)
                    : const AppIcon.visibilityOffIcon(
                        color: ColorsConstant.text400),
              ),
            ),
          ),
        ),
        if (error.isNotEmpty) ...[
          const SizedBox(height: 8),
          AppText.normal(
            error,
            textAlign: TextAlign.left,
            fontSize: 14,
            fontColor: enabled
                ? ColorsConstant.feedbackError500
                : ColorsConstant.text200,
          ),
        ],
      ],
    );
  }
}
