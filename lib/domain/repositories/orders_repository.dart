import 'package:betonchel_manager/domain/models/error/operation_status.dart';
import 'package:betonchel_manager/domain/models/filters/order_filters.dart';
import 'package:betonchel_manager/domain/models/order/order.dart';
import 'package:betonchel_manager/domain/models/order/order_data.dart';

abstract interface class OrdersRepository {
  Future<List<Order>> getOrders(OrderFilters filters);

  Future<Order> getOrderById(int id);

  Future<Order> createOrder(OrderData data);

  Future<Order> editOrder(int id, OrderData data);

  Future<OperationStatus> deleteOrder(int id);
}
