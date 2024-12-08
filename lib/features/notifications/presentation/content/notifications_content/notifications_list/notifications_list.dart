import 'package:flutter/material.dart';
import 'package:proyectos_amor/features/notifications/notifications_images.dart';
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
            timeAgo: '12 min',
            title: 'Necesitamos 3 barbies',
            subTitle: 'Melisa, Esperanza y María están a la espera',
            description: 'Queremos regarle a 3 niñas del hospital Dos de Mayo barbies para que puedan jugar.',
            button: 'Quiero donar',
          ),
          NotificationImageTextCard(
            tag: NotificationsTagEnum.thanks,
            image: NotificationsImages.notificationPlaceholder2Icon,
            timeAgo: '1 día',
            subTitle: 'Valentina dice',
            description: 'Me encantó la muñeca que recibí el día de hoy. Estoy muy feliz del regalo, gracias por todo.',
          ),
          NotificationImageTextCard(
            tag: NotificationsTagEnum.urgent,
            image: NotificationsImages.notificationPlaceholder1Icon,
            timeAgo: '2 h',
            title: '¡Urgente! 2 Bolsas de dormir',
            subTitle: 'Abraham está a la espera',
            description: 'Llegó una familia de provincia y no tiene como dormir 😭 Queremos solucionar lo antes posible.',
            button: 'Quiero donar',
          ),
          NotificationImageTextCard(
            tag: NotificationsTagEnum.news,
            image: NotificationsImages.notificationPlaceholder3Icon,
            timeAgo: '1 día',
            title: 'Bienvenida Tai Loy',
            description: 'Estamos seguros que lograremos muchas cosas juntos. ❤️🫶',
          ),
          NotificationVideoTextCard(
            tag: NotificationsTagEnum.thanks,
            image: NotificationsImages.notificationPlaceholder2Icon,
            timeAgo: '1 día',
            subTitle: 'Jesús Portocarrero dice',
            description: 'Estoy emocionado por el nuevo tren que me regalaron. Es la mejor navidad del mundo.',
          ),
        ],
      ),
    );
  }
}
