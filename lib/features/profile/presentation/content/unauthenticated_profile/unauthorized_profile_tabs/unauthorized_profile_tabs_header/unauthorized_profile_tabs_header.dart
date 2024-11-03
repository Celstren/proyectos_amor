import 'package:app_ui/app_constants/colors_constant.dart';
import 'package:app_ui/app_tabs/app_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:proyectos_amor/features/profile/profile_strings.dart';

class UnauthorizedProfileTabsHeader extends StatelessWidget {
  final TabController tabController;
  const UnauthorizedProfileTabsHeader({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, left: 24, right: 24, bottom: 8),
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: ColorsConstant.text050,
          border: Border.all(color: ColorsConstant.text100),
          borderRadius: BorderRadius.circular(56),
        ),
        child: TabBar(
          controller: tabController,
          indicator: BoxDecoration(
            color: ColorsConstant.neutralWhite,
            borderRadius: BorderRadius.circular(56),
            border: Border.all(color: ColorsConstant.text100),
          ),
          indicatorSize: TabBarIndicatorSize.tab,
          dividerColor: Colors.transparent,
          labelColor: ColorsConstant.text950,
          unselectedLabelColor: ColorsConstant.text400,
          tabs: [
            AppTabBar.normal(label: ProfileStrings.unauthorizedProfileTabsHeaderTab1, height: 42),
            AppTabBar.normal(label: ProfileStrings.unauthorizedProfileTabsHeaderTab2, height: 42),
          ],
        ),
      ),
    );
  }
}
