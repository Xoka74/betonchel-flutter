import 'package:auto_route/auto_route.dart';
import 'package:betonchel_manager/navigation/app_router.gr.dart';
import 'package:betonchel_manager/presentation/ui/components/cubits/notifications/notifications_cubit.dart';
import 'package:betonchel_manager/presentation/ui/components/cubits/notifications/notifications_state.dart';
import 'package:betonchel_manager/presentation/ui/screens/notifications_list/components/app_notification_item.dart';
import 'package:betonchel_manager/utils/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class NotificationsListScreen extends StatelessWidget {
  const NotificationsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final strings = context.strings;

    return Title(
      title: strings.notifications,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: BlocBuilder<NotificationsCubit, NotificationsState>(
          builder: (context, state) {
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Text(
                    state.notifications.isEmpty ? strings.noNotifications : strings.notifications,
                    style: const TextStyle(
                      fontSize: 28,
                    ),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(height: 40),
                ),
                SliverList.separated(
                  itemCount: state.notifications.length,
                  separatorBuilder: (context, index) => const SizedBox(height: 10),
                  itemBuilder: (context, index) {
                    final notification = state.notifications[index];

                    return AppNotificationItem(
                      notification: notification,
                      onClicked: (notification) => context.navigateTo(
                        EditApplicationPage(id: notification.applicationId),
                      ),
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
