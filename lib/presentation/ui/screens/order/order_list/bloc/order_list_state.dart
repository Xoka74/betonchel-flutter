import 'package:betonchel_manager/domain/models/order/order.dart';

sealed class OrderListState {}

class OrderListLoadingState extends OrderListState {}

class OrderListLoadedState extends OrderListState {
  final List<Order> orders;

  OrderListLoadedState(this.orders);
}

class OrderListErrorState extends OrderListState {}
