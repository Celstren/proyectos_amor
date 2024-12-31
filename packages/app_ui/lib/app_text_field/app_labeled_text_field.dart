import 'package:app_ui/app_constants/colors_constant.dart';
import 'package:app_ui/app_text/app_text.dart';
import 'package:app_ui/app_text_field/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLabeledTextField extends StatelessWidget {
  final String label;
  final String hint;
  final String error;
  final bool enabled;
  final bool readOnly;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final Function(String)? onSubmitted;
  final Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  const AppLabeledTextField({
    super.key,
    this.label = '',
    this.hint = '',
    this.error = '',
    this.enabled = true,
    this.readOnly = false,
    this.controller,
    this.textInputType,
    this.onSubmitted,
    this.onChanged,
    this.inputFormatters,
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
          fontColor: ColorsConstant.skyBlue950,
        ),
        const SizedBox(height: 8),
        AppTextField(
          controller: controller,
          hint: hint,
          textInputType: textInputType,
          onSubmitted: onSubmitted,
          onChanged: onChanged,
          enabled: enabled,
          readOnly: readOnly,
          inputFormatters: inputFormatters,
          filled: true,
          fillColor: enabled ? Colors.transparent : ColorsConstant.text100,
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
