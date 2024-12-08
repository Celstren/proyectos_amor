import 'package:app_ui/app_text/app_text.dart';
import 'package:flutter/material.dart';
import 'package:proyectos_amor/features/notifications/notifications_strings.dart';
import 'package:proyectos_amor/features/notifications/presentation/content/notifications_content/notifications_list/notifications_card_enum.dart';

class NotificationCardTag extends StatelessWidget {
  final NotificationsTagEnum tag;
  const NotificationCardTag({super.key, required this.tag});

  @override
  Widget build(BuildContext context) {
    var color = const Color(0xFFED1B4E);
    var fontColor = const Color(0xFFFE527C);
    var text = NotificationsStrings.notificationCardTagUrgent;
    switch(tag) {
      case NotificationsTagEnum.urgent: {
        color = const Color(0xFFFBB5C4);
        fontColor = const Color(0xFFED1B4E);
        text = NotificationsStrings.notificationCardTagUrgent;
      } break;
      case NotificationsTagEnum.thanks: {
        color = const Color(0xFFFFFFBF);
        fontColor = const Color(0xFFB5B521);
        text = NotificationsStrings.notificationCardTagThanks;
      } break;
      case NotificationsTagEnum.news: {
        color = const Color(0xFF9CF4F3);
        fontColor = const Color(0xFF009C39);
        text = NotificationsStrings.notificationCardTagNews;
      } break;
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5),
      ),
      child: AppText.semiBold(
        text,
        fontSize: 12,
        fontColor: fontColor,
        textAlign: TextAlign.center,
      ),
    );
  }
}
