import 'dart:async';

import 'package:betonchel_manager/data/data_source/user_data_source.dart';
import 'package:betonchel_manager/domain/hubs/notifications_hub.dart';
import 'package:betonchel_manager/domain/models/notification/notification.dart';
import 'package:betonchel_manager/presentation/ui/components/cubits/base/initializable_cubit.dart';
import 'package:betonchel_manager/presentation/ui/components/cubits/notifications/notifications_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class NotificationsCubit extends InitializableCubit<NotificationsState> {
  final NotificationsHub _notificationsHub;
  final UserDataSource _userDataSource;

  late final StreamSubscription _subscription;

  NotificationsCubit(
    this._notificationsHub,
    this._userDataSource,
  ) : super(NotificationsState([], 0));

  @override
  Future<void> initialize() async {
    _subscription = _notificationsHub.notifications.listen(_onNotification);
  }

  Future<void> _onNotification(AppNotification notification) async {
    final user = _userDataSource.user;

    if (notification is ApplicationCreatedNotification) {
      if (notification.application.user.id == user?.id) {
        return;
      }
    } else if (notification is ApplicationUpdatedNotification) {
      if (notification.oldApp.user.id == user?.id) {
        return;
      }
    }

    emit(NotificationsState([notification, ...state.notifications], state.unreadCount + 1));
  }

  void readAll() => emit(NotificationsState(state.notifications, 0));

  @override
  Future<void> close() {
    _subscription.cancel();

    return super.close();
  }
}
