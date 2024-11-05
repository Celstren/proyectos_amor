import 'package:app_ui/app_constants/colors_constant.dart';
import 'package:app_ui/app_constants/size_constants.dart';
import 'package:app_ui/app_text/app_text.dart';
import 'package:flutter/material.dart';

class CreateAccountPasswordCheck extends StatelessWidget {
  final String label;
  final bool checked;
  const CreateAccountPasswordCheck({super.key, this.label = '', this.checked = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 18,
          width: 18,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: checked ? null : Border.all(
              color: ColorsConstant.feedbackSuccess600,
              width: 2,
            ),
            color: checked ? ColorsConstant.feedbackSuccess600 : null,
          ),
          child: Center(
            child: Icon(
              Icons.check,
              size: 14,
              color: checked ? ColorsConstant.neutralWhite : ColorsConstant.feedbackSuccess600,
            ),
          ),
        ),
        const SizedBox(width: SizeConstants.sm),
        AppText.normal(
          label,
          fontSize: 12,
          fontColor: ColorsConstant.text950,
          textAlign: TextAlign.start,
        ),
      ],
    );
  }
}
