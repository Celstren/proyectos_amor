import 'package:app_ui/app_constants/colors_constant.dart';
import 'package:app_ui/app_constants/size_constants.dart';
import 'package:app_ui/app_tabs/app_tab.dart';
import 'package:flutter/material.dart';

class AppTabs extends StatelessWidget {
  final List<AppTab> items;
  const AppTabs({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(SizeConstants.md),
        color: ColorsConstant.text050,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: items.map((i) => Expanded(child: i)).toList(),
      ),
    );
  }
}
