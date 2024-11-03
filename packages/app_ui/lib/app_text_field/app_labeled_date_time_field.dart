import 'package:app_ui/app_constants/colors_constant.dart';
import 'package:app_ui/app_text/app_text.dart';
import 'package:app_ui/app_text_field/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLabeledDateTimeField extends StatelessWidget {
  final String label;
  final String hint;
  final String error;
  final bool enabled;
  final DateTime? initial;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? inputFormatters;
  final Function(DateTime? date) onChanged;
  final Widget? suffix;
  const AppLabeledDateTimeField({
    super.key,
    this.label = '',
    this.hint = '',
    this.error = '',
    this.enabled = true,
    this.initial,
    this.firstDate,
    this.lastDate,
    this.textInputType,
    this.inputFormatters,
    this.suffix,
    required this.onChanged,
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
          controller: TextEditingController(text: initial != null ? '${initial?.year}/${initial?.month}/${initial?.day}' : ''),
          borderColor: error.isNotEmpty ? ColorsConstant.feedbackError400 : ColorsConstant.text100,
          highlightBorderColor: error.isNotEmpty ? ColorsConstant.feedbackError400 : ColorsConstant.skyBlue600,
          borderWidth: error.isNotEmpty ? 2 : null,
          hint: hint,
          textInputType: textInputType,
          onTap: () async {
            final newDate = await showDatePicker(
              context: context,
              firstDate: firstDate ?? DateTime(1900),
              lastDate: lastDate ?? DateTime(2300),
              initialEntryMode: DatePickerEntryMode.calendarOnly,
            );
            if (newDate == null) return;
            onChanged(newDate);
          },
          enabled: enabled,
          readOnly: true,
          inputFormatters: inputFormatters,
          suffix: suffix,
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
