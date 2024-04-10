import 'dart:async';

import 'package:betonchel_manager/domain/hubs/notifications_hub.dart';
import 'package:betonchel_manager/domain/models/notification/notification.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class NotificationsCubit extends Cubit<Notification?> {
  final NotificationsHub _notificationsHub;

  late final StreamSubscription _subscription;

  NotificationsCubit(this._notificationsHub) : super(null) {
    _subscription = _notificationsHub.notifications.listen(_onNotification);
  }

  void _onNotification(Notification notification) {
    emit(notification);
  }

  @override
  Future<void> close() {
    _subscription.cancel();

    return super.close();
  }
}
