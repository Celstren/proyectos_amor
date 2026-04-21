import 'package:app_ui/app_constants/colors_constant.dart';
import 'package:app_ui/app_text/app_text.dart';
import 'package:flutter/material.dart';

class UserInitialsAvatar extends StatelessWidget {
  final String? firstName;
  final String? lastName;
  final String? imageUrl;
  final double size;
  final Widget? bottomRight;

  const UserInitialsAvatar({
    super.key,
    this.firstName,
    this.lastName,
    this.imageUrl,
    this.size = 102,
    this.bottomRight,
  });

  bool get _hasImage => imageUrl != null && imageUrl!.trim().isNotEmpty;

  String get _initials {
    final names = [
      firstName?.trim(),
      lastName?.trim(),
    ].where((name) => name != null && name.isNotEmpty).cast<String>();

    final initials =
        names.map((name) => name.characters.first.toUpperCase()).take(2).join();

    return initials.isNotEmpty ? initials : 'U';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: ColorsConstant.neutralWhite,
        border: Border.all(
          color: ColorsConstant.neutralWhite,
        ),
        image: _hasImage
            ? DecorationImage(
                image: NetworkImage(imageUrl!),
                fit: BoxFit.cover,
              )
            : null,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (!_hasImage)
            AppText.bold(
              _initials,
              fontSize: size * 0.36,
              fontColor: ColorsConstant.primaryColor,
              textAlign: TextAlign.center,
            ),
          if (bottomRight != null)
            Align(
              alignment: Alignment.bottomRight,
              child: bottomRight,
            ),
        ],
      ),
    );
  }
}
