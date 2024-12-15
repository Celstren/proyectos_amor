import 'package:app_ui/app_button/app_button.dart';
import 'package:flutter/material.dart';
import 'package:proyectos_amor/features/profile_picture_preview/presentation/content/profile_picture/profile_decoration_one.dart';
import 'package:proyectos_amor/features/profile_picture_preview/profile_picture_preview_images.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        SizedBox(
          height: 314,
          child: Stack(
            children: <Widget>[
              Image.asset(
                height: 314,
                ProfilePicturePreviewImages.profileUserPlaceholderIcon,
                fit: BoxFit.cover,
              ),
              const Positioned(
                bottom: 0,
                child: Center(
                  child: ProfileDecorationOne(),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              AppButton.bordered(
                text: 'Descargar foto',
                onTap: () {},
              ),
              const SizedBox(height: 16),
              AppButton.solid(
                text: 'Compartir',
                onTap: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
