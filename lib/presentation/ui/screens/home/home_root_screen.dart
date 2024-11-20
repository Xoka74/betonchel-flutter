import 'package:auto_route/auto_route.dart';
import 'package:betonchel_manager/presentation/ui/components/layouts/home_layout.dart';
import 'package:betonchel_manager/presentation/ui/screens/home/components/remote_message_handler.dart';
import 'package:betonchel_manager/presentation/ui/screens/home/dependencies/home_root_dependencies.dart';
import 'package:betonchel_manager/presentation/ui/screens/home/home_side_bar.dart';
import 'package:betonchel_manager/presentation/ui/screens/home/home_top_bar.dart';
import 'package:betonchel_manager/utils/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomeRootScreen extends StatelessWidget implements AutoRouteWrapper {
  const HomeRootScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) => HomeRootDependencies(child: this);

  @override
  Widget build(BuildContext context) {
    final strings = context.strings;
    final smallerThanTablet = context.smallerThanTablet;

    return AutoRouter(
      builder: (context, child) {
        return Scaffold(
          drawer: smallerThanTablet
              ? Drawer(
                  child: ListView(
                    children: [
                      Text(strings.orders),
                      Text(strings.goods),
                      Text(strings.employees),
                    ],
                  ),
                )
              : null,
          appBar: smallerThanTablet ? AppBar() : null,
          body: HomeLayout(
            topBar: const HomeTopBar(),
            sideBar: const HomeSideBar(),
            child: RemoteMessageHandler(
              child: child,
            ),
          ),
        );
      },
    );
  }
}
