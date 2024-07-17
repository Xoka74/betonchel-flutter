import 'package:auto_route/auto_route.dart';
import 'package:betonchel_manager/navigation/web_router.gr.dart';
import 'package:betonchel_manager/presentation/ui/components/cubits/user/user_cubit.dart';
import 'package:betonchel_manager/presentation/ui/components/cubits/user/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              const Spacer(),
              const SizedBox(width: 24),
              IconButton(
                onPressed: () => context.navigateTo(const ProfilePage()),
                icon: const Icon(Icons.person),
              ),
              const SizedBox(width: 24),
            ],
          ),
        );
      },
    );
  }
}
