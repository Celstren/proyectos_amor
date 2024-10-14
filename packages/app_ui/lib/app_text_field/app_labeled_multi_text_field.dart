import 'package:app_ui/app_constants/colors_constant.dart';
import 'package:app_ui/app_text/app_text.dart';
import 'package:app_ui/app_text_field/app_text_field.dart';
import 'package:flutter/material.dart';

class AppLabeledMultiTextField extends StatelessWidget {
  final String label;
  final String hint;
  final String error;
  final bool enabled;
  final double height;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final Function(String)? onSubmitted;
  final Function(String)? onChanged;
  const AppLabeledMultiTextField({
    super.key,
    this.label = '',
    this.hint = '',
    this.error = '',
    this.enabled = true,
    this.controller,
    this.textInputType,
    this.onSubmitted,
    this.onChanged,
    this.height = 98,
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
          controller: controller,
          borderColor: ColorsConstant.text100,
          highlightBorderColor: ColorsConstant.skyBlue600,
          hint: hint,
          textInputType: TextInputType.visiblePassword,
          onSubmitted: onSubmitted,
          onChanged: onChanged,
          maxLines: null,
          height: height,
          expands: true,
          textAlignVertical: TextAlignVertical.top,
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
