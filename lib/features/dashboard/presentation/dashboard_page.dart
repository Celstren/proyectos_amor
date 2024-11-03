import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:proyectos_amor/features/dashboard/presentation/content/app_bottom_navigation/app_bottom_navigation.dart';
import 'package:proyectos_amor/router/app_router.gr.dart';

@RoutePage(name: 'DashboardPageRoute')
class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      lazyLoad: true,
      routes: const [
        HomePageRoute(),
        AwardPageRoute(),
        ProfilePageRoute(),
      ],
      transitionBuilder: (context, child, animation) => child,
      resizeToAvoidBottomInset: false,
      bottomNavigationBuilder: (context, tabsRouter) => AppBottomNavigation(
        index: tabsRouter.activeIndex,
        onTap: (tab) => tabsRouter.setActiveIndex(tab.index),
      ),
    );
  }
}
