import 'package:betonchel_manager/domain/models/order/order.dart';

class OrderGroup {
  final double latitude;
  final double longitude;

  final List<Order> orders;

  const OrderGroup({
    required this.latitude,
    required this.longitude,
    required this.orders,
  });
}
