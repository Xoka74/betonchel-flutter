import 'package:auto_route/auto_route.dart';
import 'package:betonchel_manager/presentation/ui/components/builders/user_builder.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return UserBuilder(
      builder: (user) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Text(user.email),
        );
      },
    );
  }
}
