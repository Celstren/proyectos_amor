import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:proyectos_amor/features/donate_gift/presentation/content/donate_gift_content.dart';

@RoutePage(name: 'DonateGiftPageRoute')
class DonateGiftPage extends StatelessWidget {
  const DonateGiftPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const DonateGiftContent();
  }
}
