import 'package:app_ui/app_constants/colors_constant.dart';
import 'package:app_ui/app_constants/size_constants.dart';
import 'package:flutter/material.dart';

class AppCarouselIndicator extends StatelessWidget {
  final List<int> selected;
  final int length;
  final Color selectedColor;
  final Color unselectedColor;
  final Color background;
  const AppCarouselIndicator({
    super.key,
    required this.selected,
    this.length = 1,
    this.selectedColor = ColorsConstant.skyBlue600,
    this.unselectedColor = ColorsConstant.text200,
    this.background = ColorsConstant.text050,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(SizeConstants.sm),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(SizeConstants.sm),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: List.generate(
          length,
          (idx) => Container(
            height: 8,
            width: 8,
            margin: idx != 0 ? const EdgeInsets.only(left: 8) : null,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: selected.contains(idx) ? selectedColor : unselectedColor,
            ),
          ),
        ),
      ),
    );
  }
}
