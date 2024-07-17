import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:betonchel_manager/navigation/web_router.gr.dart';
import 'package:betonchel_manager/presentation/ui/components/cubits/notifications/user_listener.dart';
import 'package:betonchel_manager/presentation/ui/components/layouts/home_layout.dart';
import 'package:betonchel_manager/presentation/ui/screens/home/dependencies/home_root_dependencies.dart';
import 'package:betonchel_manager/presentation/ui/screens/home/home_side_bar.dart';
import 'package:betonchel_manager/presentation/ui/screens/home/home_top_bar.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomeRootScreen extends StatefulWidget implements AutoRouteWrapper {
  const HomeRootScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) => HomeRootDependencies(child: this);

  @override
  State<HomeRootScreen> createState() => _HomeRootScreenState();
}

class _HomeRootScreenState extends State<HomeRootScreen> {
  late final StreamSubscription _subscription;

  @override
  void initState() {
    _subscription = FirebaseMessaging.onMessageOpenedApp.listen(_onRemoteMessage);

    FirebaseMessaging.instance.getInitialMessage().then(
      (message) async {
        if (message == null) {
          return;
        }

        return _onRemoteMessage(message);
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return UserListener(
      child: AutoRouter(
        builder: (context, child) {
          return Scaffold(
            drawer: const NavigationDrawer(
              children: [Text('test')],
            ),
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

  Future<void> _onRemoteMessage(RemoteMessage message) async {
    final orderId = int.tryParse(message.data['order_id']);

    if (orderId != null) {
      context.router.navigate(OrderDetailsPage(id: orderId));
    }
  }

  @override
  void dispose() {
    _subscription.cancel();

    super.dispose();
  }
}
