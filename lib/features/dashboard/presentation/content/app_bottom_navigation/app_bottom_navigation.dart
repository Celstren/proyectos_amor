import 'package:app_ui/app_constants/colors_constant.dart';
import 'package:flutter/material.dart';
import 'package:proyectos_amor/features/dashboard/dashboard_strings.dart';
import 'package:proyectos_amor/features/dashboard/presentation/content/app_bottom_navigation/app_bottom_navigation_item.dart';
import 'package:app_ui/app_image/app_icon_path.dart';

enum BottomNav { home, award, profile }

class AppBottomNavigation extends StatelessWidget {
  final int index;
  final Function(BottomNav) onTap;
  const AppBottomNavigation({super.key, this.index = 0, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 24),
      decoration: BoxDecoration(
        border: const Border(
          top: BorderSide(color: ColorsConstant.text050),
        ),
        color: ColorsConstant.neutralWhite,
        boxShadow: <BoxShadow>[
          BoxShadow(
            offset: const Offset(0, -1),
            color: Colors.grey.withOpacity(.05),
            blurRadius: 1,
            spreadRadius: 4,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        child: SizedBox(
          width: 327,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: AppBottomNavigationItem(
                  label: DashboardStrings.bottomNavigationHomeLabel,
                  asset:  index == BottomNav.home.index ? AppIconPath.homeFilledIcon : AppIconPath.homeOutlineIcon,
                  selected: index == BottomNav.home.index,
                  onTap: () => onTap(BottomNav.home),
                ),
              ),
              Expanded(
                child: AppBottomNavigationItem(
                  label: DashboardStrings.bottomNavigationAwardLabel,
                  asset:  index == BottomNav.award.index ? AppIconPath.awardFilledIcon : AppIconPath.awardOutlineIcon,
                  selected: index == BottomNav.award.index,
                  onTap: () => onTap(BottomNav.award),
                ),
              ),
              Expanded(
                child: AppBottomNavigationItem(
                  label: DashboardStrings.bottomNavigationProfileLabel,
                  asset:  index == BottomNav.profile.index ? AppIconPath.userFilledIcon : AppIconPath.userOutlineIcon,
                  selected: index == BottomNav.profile.index,
                  onTap: () => onTap(BottomNav.profile),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
