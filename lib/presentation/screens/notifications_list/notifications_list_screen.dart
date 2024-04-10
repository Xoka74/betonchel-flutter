import 'package:auto_route/auto_route.dart';
import 'package:betonchel_manager/presentation/components/layouts/default_screen_layout.dart';
import 'package:betonchel_manager/utils/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

@RoutePage()
class NotificationsListScreen extends StatelessWidget {
  const NotificationsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final strings = context.strings;

    return DefaultScreenLayout(
      appBar: AppBar(
        title: Text(strings.notifications),
        leading: IconButton(
          onPressed: context.router.maybePop,
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
      ),
      child: const Padding(
        padding: EdgeInsets.all(20),
        child: Text('Notifications List'),
      ),
    );
  }
}
