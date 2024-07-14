import 'package:betonchel_manager/domain/models/order/order.dart';

sealed class AppNotification {
  final DateTime time;
  final int orderId;

  AppNotification(this.time, this.orderId);
}

class OrderCreatedNotification extends AppNotification {
  final Order order;

  OrderCreatedNotification(this.order) : super(DateTime.now(), order.id);
}

class OrderUpdatedNotification extends AppNotification {
  final Order oldOrder;

  OrderUpdatedNotification(this.oldOrder) : super(DateTime.now(), oldOrder.id);
}
