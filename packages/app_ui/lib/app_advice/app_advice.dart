import 'package:app_ui/app_constants/colors_constant.dart';
import 'package:app_ui/app_image/app_icon.dart';
import 'package:app_ui/app_text/app_text.dart';
import 'package:flutter/material.dart';

class AppAdvice extends StatelessWidget {
  final Color background;
  final Color borderColor;
  final Widget icon;
  final Color iconBackground;
  final Color iconBorderColor;
  final String title;
  final Color titleColor;
  final String description;
  final Color descriptionColor;

  const AppAdvice.info({
    super.key,
    this.background = ColorsConstant.skyBlue050,
    this.borderColor = ColorsConstant.skyBlue200,
    this.icon = const AppIcon.infoIcon(color: ColorsConstant.skyBlue600),
    this.iconBackground = ColorsConstant.skyBlue100,
    this.iconBorderColor = Colors.transparent,
    this.title = '',
    this.titleColor = ColorsConstant.skyBlue950,
    this.description = '',
    this.descriptionColor = ColorsConstant.skyBlue900,
  });

  const AppAdvice.recommendation({
    super.key,
    this.background = ColorsConstant.feedbackWarning050,
    this.borderColor = ColorsConstant.feedbackWarning200,
    this.icon = const AppIcon.annotationIcon(color: ColorsConstant.feedbackWarning600),
    this.iconBackground = ColorsConstant.feedbackWarning100,
    this.iconBorderColor = Colors.transparent,
    this.title = '',
    this.titleColor = ColorsConstant.feedbackWarning700,
    this.description = '',
    this.descriptionColor = ColorsConstant.feedbackWarning600,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: background,
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: iconBackground,
              border: Border.all(color: iconBorderColor),
              borderRadius: BorderRadius.circular(4),
            ),
            child: icon,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                if (title.isNotEmpty)
                  AppText.medium(
                    title,
                    fontColor: titleColor,
                    fontSize: 14,
                  ),
                if (title.isNotEmpty && description.isNotEmpty)
                  const SizedBox(height: 4),
                if (description.isNotEmpty)
                  AppText.normal(
                    description,
                    fontColor: descriptionColor,
                    fontSize: 14,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
