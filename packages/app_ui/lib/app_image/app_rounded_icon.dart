import 'package:app_ui/app_constants/colors_constant.dart';
import 'package:flutter/material.dart';

class AppRoundedIcon extends StatelessWidget {
  final Color background;
  final Widget icon;

  const AppRoundedIcon({
    super.key,
    this.background = ColorsConstant.skyBlue200,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: 48,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: icon,
      ),
    );
  }
}
