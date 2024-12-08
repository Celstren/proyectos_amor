import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:proyectos_amor/features/notifications/presentation/content/notifications_content.dart';

@RoutePage(name: 'NotificationsPageRoute')
class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) => const NotificationsContent();
}
