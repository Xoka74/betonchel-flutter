import 'package:auto_route/auto_route.dart';
import 'package:betonchel_manager/presentation/ui/components/cubits/notifications/user_listener.dart';
import 'package:betonchel_manager/presentation/ui/components/layouts/home_layout.dart';
import 'package:betonchel_manager/presentation/ui/screens/home/dependencies/home_root_dependencies.dart';
import 'package:betonchel_manager/presentation/ui/screens/home/home_side_bar.dart';
import 'package:betonchel_manager/presentation/ui/screens/home/home_top_bar.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomeRootScreen extends StatelessWidget implements AutoRouteWrapper {
  const HomeRootScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) => HomeRootDependencies(child: this);

  @override
  Widget build(BuildContext context) {
    return UserListener(
      child: AutoRouter(
        builder: (context, child) {
          return Scaffold(
            body: HomeLayout(
              topBar: const HomeTopBar(),
              sideBar: const HomeSideBar(),
              child: child,
            ),
          );
        },
      ),
    );
  }
}
