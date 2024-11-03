import 'package:app_ui/app_image/app_image.dart';
import 'package:flutter/material.dart';
import 'package:proyectos_amor/features/award/award_images.dart';

class AwardHeader extends StatelessWidget {
  const AwardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppImage.assetImage(
      height: 120,
      asset: AwardImages.awardHeaderPlaceholder,
      fit: BoxFit.cover,
    );
  }
}
