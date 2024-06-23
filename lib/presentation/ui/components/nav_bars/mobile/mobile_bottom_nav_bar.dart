import 'package:auto_route/auto_route.dart';
import 'package:betonchel_manager/utils/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class MobileBottomNavBar extends StatelessWidget {
  const MobileBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final strings = context.strings;
    final tabsRouter = AutoTabsRouter.of(context);

    return BottomNavigationBar(
      onTap: (index) => _onItemTap(index, tabsRouter),
      showUnselectedLabels: true,
      showSelectedLabels: true,
      useLegacyColorScheme: false,
      currentIndex: tabsRouter.activeIndex,
      items: [
        BottomNavigationBarItem(
          icon: const Icon(Icons.notifications),
          label: strings.notifications,
          tooltip: strings.notifications,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.home),
          label: strings.home,
          tooltip: strings.home,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.person),
          label: strings.profile,
          tooltip: strings.profile,
        ),
      ],
    );
  }

  void _onItemTap(int index, TabsRouter tabsRouter) {
    if (tabsRouter.activeIndex != index) {
      return tabsRouter.setActiveIndex(index);
    }

    final currentChild = tabsRouter.currentChild;

    if (currentChild != null) {
      final currentTabRouter = tabsRouter.innerRouterOf<StackRouter>(
        currentChild.route.name,
      );

      if (currentTabRouter != null) {
        currentTabRouter.popUntilRouteWithName(
          currentTabRouter.stackData.first.name,
        );
      }
    }
  }
}
