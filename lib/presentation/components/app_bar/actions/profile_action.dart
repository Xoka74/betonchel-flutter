import 'package:auto_route/auto_route.dart';
import 'package:betonchel_manager/navigation/app_router.gr.dart';
import 'package:betonchel_manager/presentation/components/cubits/user/user_cubit.dart';
import 'package:betonchel_manager/presentation/components/cubits/user/user_state.dart';
import 'package:betonchel_manager/utils/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileAction extends StatelessWidget {
  const ProfileAction({super.key});

  @override
  Widget build(BuildContext context) {
    final strings = context.strings;

    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        return InkWell(
          onTap: () => context.router.push(const ProfilePage()),
          child: Row(
            children: [
              Text(strings.profile),
            ],
          ),
        );
      },
    );
  }
}
