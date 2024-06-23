import 'package:betonchel_manager/domain/models/application/application.dart';

sealed class AppNotification {
  final DateTime time;
  final int applicationId;

  AppNotification(this.time, this.applicationId);
}

class ApplicationCreatedNotification extends AppNotification {
  final Application application;

  ApplicationCreatedNotification(this.application) : super(DateTime.now(), application.id);
}

class ApplicationUpdatedNotification extends AppNotification {
  final Application oldApp;

  ApplicationUpdatedNotification(this.oldApp) : super(DateTime.now(), oldApp.id);
}
