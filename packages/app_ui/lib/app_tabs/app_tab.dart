import 'package:app_ui/app_constants/colors_constant.dart';
import 'package:app_ui/app_constants/size_constants.dart';
import 'package:app_ui/app_text/app_text.dart';
import 'package:flutter/material.dart';

class AppTab extends StatelessWidget {
  final VoidCallback? onTap;
  final bool selected;
  final String label;
  const AppTab({
    super.key,
    this.onTap,
    this.selected = false,
    this.label = '',
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: selected ? ColorsConstant.neutralWhite : Colors.transparent,
          borderRadius: BorderRadius.circular(SizeConstants.sm),
        ),
        child: AppText.medium(
          label,
          fontColor: selected ? ColorsConstant.text950 : ColorsConstant.text400,
          fontSize: 14,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
