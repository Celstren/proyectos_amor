import 'package:app_ui/app_scaffold/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:proyectos_amor/features/notifications/presentation/content/notifications_content/notifications_list/notifications_list.dart';
import 'package:proyectos_amor/features/notifications/presentation/content/notifications_header/notifications_header.dart';

class NotificationsContent extends StatefulWidget {
  const NotificationsContent({super.key});

  @override
  State<NotificationsContent> createState() => _NotificationsContentState();
}

class _NotificationsContentState extends State<NotificationsContent> {
  @override
  Widget build(BuildContext context) {
    return const AppScaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          NotificationsHeader(),
          Expanded(child: NotificationsList()),
        ],
      ),
    );
  }
}
