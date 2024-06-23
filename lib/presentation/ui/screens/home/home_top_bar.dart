import 'package:auto_route/auto_route.dart';
import 'package:badges/badges.dart' as badges;
import 'package:betonchel_manager/navigation/app_router.gr.dart';
import 'package:betonchel_manager/presentation/ui/components/cubits/notifications/notifications_cubit.dart';
import 'package:betonchel_manager/presentation/ui/components/cubits/user/user_cubit.dart';
import 'package:betonchel_manager/presentation/ui/components/cubits/user/user_state.dart';
import 'package:betonchel_manager/utils/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colorsTheme;
    final notificationsCubit = context.watch<NotificationsCubit>();
    final unreadCount = notificationsCubit.state.unreadCount;

    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              const Spacer(),
              badges.Badge(
                badgeStyle: badges.BadgeStyle(
                  badgeColor: colors.backgroundPrimary,
                ),
                showBadge: unreadCount > 0,
                badgeContent: Text(unreadCount.toString()),
                child: IconButton(
                  onPressed: () {
                    context.navigateTo(const NotificationsListPage());
                    notificationsCubit.readAll();
                  },
                  icon: const Icon(Icons.notifications),
                ),
              ),
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
