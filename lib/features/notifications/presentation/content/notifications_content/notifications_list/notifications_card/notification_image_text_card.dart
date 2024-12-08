import 'package:app_ui/app_button/app_button.dart';
import 'package:app_ui/app_constants/colors_constant.dart';
import 'package:app_ui/app_constants/size_constants.dart';
import 'package:app_ui/app_image/app_image.dart';
import 'package:app_ui/app_text/app_text.dart';
import 'package:flutter/material.dart';
import 'package:proyectos_amor/features/notifications/presentation/content/notifications_content/notifications_list/notifications_card/notification_card_tag.dart';
import 'package:proyectos_amor/features/notifications/presentation/content/notifications_content/notifications_list/notifications_card_enum.dart';

class NotificationImageTextCard extends StatelessWidget {
  final NotificationsTagEnum tag;
  final String image;
  final String timeAgo;
  final String title;
  final String subTitle;
  final String description;
  final String button;
  const NotificationImageTextCard({
    super.key,
    required this.image,
    this.tag = NotificationsTagEnum.urgent,
    this.timeAgo = '',
    this.title = '',
    this.subTitle = '',
    this.description = '',
    this.button = '',
});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(SizeConstants.xl),
      margin: const EdgeInsets.only(left: SizeConstants.xl, right: SizeConstants.xl, bottom: SizeConstants.xl),
      decoration: BoxDecoration(
        color: ColorsConstant.neutralWhite,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: ColorsConstant.text100),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              NotificationCardTag(tag: tag),
              const SizedBox(width: SizeConstants.lg),
              AppText.normal(
                timeAgo,
                fontColor: ColorsConstant.text600,
                fontSize: 12,
                textAlign: TextAlign.start,
              ),
            ],
          ),
          if (title.isNotEmpty)
            ...[
              const SizedBox(height: SizeConstants.lg),
              AppText.bold(
                title,
                fontColor: ColorsConstant.text950,
                fontSize: 18,
                textAlign: TextAlign.start,
              ),
            ],
          if (image.isNotEmpty)
            ...[
              const SizedBox(height: SizeConstants.sm),
              Center(
                child: ClipOval(
                  child: AppImage.assetImage(
                    asset: image,
                    fit: BoxFit.cover,
                    size: 120,
                  ),
                ),
              ),
            ],
          if (subTitle.isNotEmpty)
            ...[
              const SizedBox(height: SizeConstants.sm),
              AppText.semiBold(
                subTitle,
                fontColor: ColorsConstant.text950,
                fontSize: 12,
                textAlign: TextAlign.start,
              ),
            ],
          if (description.isNotEmpty)
            ...[
              const SizedBox(height: SizeConstants.sm),
              AppText.normal(
                description,
                fontColor: ColorsConstant.text600,
                fontSize: 12,
                textAlign: TextAlign.start,
              ),
            ],
          if (button.isNotEmpty)
            ...[
              const SizedBox(height: SizeConstants.xl),
              AppButton(
                text: button,
                onTap: () {},
              ),
            ],
        ],
      ),
    );
  }
}
