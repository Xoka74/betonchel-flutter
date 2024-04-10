import 'package:auto_route/auto_route.dart';
import 'package:betonchel_manager/presentation/ui/components/layouts/default_screen_layout.dart';
import 'package:betonchel_manager/presentation/ui/screens/application/application_new/dependencies/new_application_screen_dependencies.dart';
import 'package:flutter/material.dart';

@RoutePage()
class NewApplicationScreen extends StatelessWidget implements AutoRouteWrapper {
  final DateTime? deliveryDate;

  const NewApplicationScreen({
    super.key,
    required this.deliveryDate,
  });

  @override
  Widget wrappedRoute(BuildContext context) => NewApplicationScreenDependencies(
        deliveryDate: deliveryDate,
        child: this,
      );

  @override
  Widget build(BuildContext context) {
    return DefaultScreenLayout(
      appBar: AppBar(
        leading: IconButton(
          onPressed: context.router.maybePop,
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
      ),
      child: const Padding(
        padding: EdgeInsets.all(20),
        child: Text('New application'),
      ),
    );
  }
}
