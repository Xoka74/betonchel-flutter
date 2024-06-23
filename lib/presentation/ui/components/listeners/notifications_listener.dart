import 'package:betonchel_manager/domain/models/notification/notification.dart' as models;
import 'package:betonchel_manager/presentation/ui/components/cubits/notifications/notifications_cubit.dart';
import 'package:betonchel_manager/presentation/ui/components/cubits/notifications/notifications_state.dart';
import 'package:betonchel_manager/presentation/ui/components/cubits/user/user_cubit.dart';
import 'package:betonchel_manager/presentation/ui/components/cubits/user/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationsListener extends StatelessWidget {
  final Widget child;

  const NotificationsListener({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<NotificationsCubit, NotificationsState>(
      listenWhen: (left, right) => left.notifications.length != right.notifications.length,
      listener: (context, items) {
        _showSnackBar(context, const Text('Новое уведомление'));
      },
      child: child,
    );
  }

  void _showSnackBar(BuildContext context, Widget content) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: content));
  }
}
