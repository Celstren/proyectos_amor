import 'package:flutter/material.dart';
import 'package:proyectos_amor/features/notifications/notifications_images.dart';
import 'package:proyectos_amor/features/notifications/notifications_strings.dart';
import 'package:proyectos_amor/features/notifications/presentation/content/notifications_content/notifications_list/notifications_card/notification_image_text_card.dart';
import 'package:proyectos_amor/features/notifications/presentation/content/notifications_content/notifications_list/notifications_card/notification_text_card.dart';
import 'package:proyectos_amor/features/notifications/presentation/content/notifications_content/notifications_list/notifications_card/notification_video_text_card.dart';
import 'package:proyectos_amor/features/notifications/presentation/content/notifications_content/notifications_list/notifications_card_enum.dart';

class NotificationsList extends StatelessWidget {
  const NotificationsList({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          NotificationTextCard(
            tag: NotificationsTagEnum.urgent,
            timeAgo: NotificationsStrings.sampleDonationTimeAgo,
            title: NotificationsStrings.sampleDonationTitle,
            subTitle: NotificationsStrings.sampleDonationSubTitle,
            description: NotificationsStrings.sampleDonationDescription,
            button: NotificationsStrings.sampleDonationButton,
          ),
          NotificationImageTextCard(
            tag: NotificationsTagEnum.thanks,
            image: NotificationsImages.notificationPlaceholder2Icon,
            timeAgo: NotificationsStrings.sampleThanksTimeAgo,
            subTitle: NotificationsStrings.sampleThanksSubTitle,
            description: NotificationsStrings.sampleThanksDescription,
          ),
          NotificationImageTextCard(
            tag: NotificationsTagEnum.urgent,
            image: NotificationsImages.notificationPlaceholder1Icon,
            timeAgo: NotificationsStrings.sampleUrgentTimeAgo,
            title: NotificationsStrings.sampleUrgentTitle,
            subTitle: NotificationsStrings.sampleUrgentSubTitle,
            description: NotificationsStrings.sampleUrgentDescription,
            button: NotificationsStrings.sampleDonationButton,
          ),
          NotificationImageTextCard(
            tag: NotificationsTagEnum.news,
            image: NotificationsImages.notificationPlaceholder3Icon,
            timeAgo: NotificationsStrings.sampleThanksTimeAgo,
            title: NotificationsStrings.sampleNewsTitle,
            description: NotificationsStrings.sampleNewsDescription,
          ),
          NotificationVideoTextCard(
            tag: NotificationsTagEnum.thanks,
            image: NotificationsImages.notificationPlaceholder2Icon,
            timeAgo: NotificationsStrings.sampleThanksTimeAgo,
            subTitle: NotificationsStrings.sampleVideoSubTitle,
            description: NotificationsStrings.sampleVideoDescription,
          ),
        ],
      ),
    );
  }
}
