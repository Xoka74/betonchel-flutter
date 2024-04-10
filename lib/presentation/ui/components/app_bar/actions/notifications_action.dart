import 'package:auto_route/auto_route.dart';
import 'package:betonchel_manager/navigation/app_router.gr.dart';
import 'package:flutter/material.dart';

class NotificationsAction extends StatelessWidget {
  const NotificationsAction({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => context.router.push(const NotificationsListPage()),
      icon: const Icon(Icons.notifications),
    );
  }
}
