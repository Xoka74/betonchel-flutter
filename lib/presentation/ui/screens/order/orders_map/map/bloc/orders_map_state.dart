import 'package:betonchel_manager/domain/models/order/order.dart';

sealed class OrdersMapState {}

class OrdersMapLoadingState extends OrdersMapState {}

class OrdersMapLoadedState extends OrdersMapState {
  final List<Order> orders;

  OrdersMapLoadedState(this.orders);
}

class OrdersMapErrorState extends OrdersMapState {}
