import 'package:app_ui/app_constants/fonts_constant.dart';
import 'package:flutter/material.dart';

class AppTabBar {
  static Widget normal({required String label, required double? height}) => Tab(
        height: height,
        child: Text(
          label,
          style: const TextStyle(
            fontFamily: FontsConstant.montserrat,
            package: 'app_ui',
          ),
          overflow: TextOverflow.ellipsis,
        ),
      );
}
