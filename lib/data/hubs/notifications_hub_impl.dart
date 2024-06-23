import 'dart:async';

import 'package:betonchel_manager/data/hubs/hub_events.dart';
import 'package:betonchel_manager/di/constants/injection_keys.dart';
import 'package:betonchel_manager/domain/hubs/notifications_hub.dart';
import 'package:betonchel_manager/domain/models/application/application.dart';
import 'package:betonchel_manager/domain/models/notification/notification.dart';
import 'package:injectable/injectable.dart';
import 'package:signalr_netcore/signalr_client.dart';

@Injectable(as: NotificationsHub)
class NotificationsHubImpl implements NotificationsHub {
  final StreamController<AppNotification> _notifications = StreamController();

  final String _baseNotificationsUrl;

  late final HubConnection _hubConnection;

  NotificationsHubImpl(
    @Named(InjectionKeys.baseNotificationsUrl) this._baseNotificationsUrl,
  ) {
    _init();
  }

  Future<void> _init() async {
    _hubConnection = HubConnectionBuilder().withUrl(_baseNotificationsUrl).withAutomaticReconnect().build();

    _hubConnection.on(HubEvents.applicationCreated, (args) {
      final app = Application.fromJson(args?[0] as Map<String, dynamic>);
      final notification = ApplicationCreatedNotification(app);
      _notifications.add(notification);
    });

    _hubConnection.on(HubEvents.applicationUpdated, (args) {
      final oldData = args?[0] as Map<String, dynamic>;

      final oldApp = Application.fromJson(oldData);

      final notification = ApplicationUpdatedNotification(oldApp);

      _notifications.add(notification);
    });

    await start();
  }

  Future<void> start() async {
    await _hubConnection.start();
    print('NotificationsHubImpl started');
  }

  Future<void> stop() async {
    await _hubConnection.stop();
  }

  @override
  Stream<AppNotification> get notifications => _notifications.stream;
}
