import 'package:betonchel_manager/domain/models/order/order.dart';

sealed class OrderDetailsState {}

class OrderDetailsLoadingState extends OrderDetailsState {}

class OrderDetailsLoadedState extends OrderDetailsState {
  final Order order;

  OrderDetailsLoadedState(this.order);
}

class OrderDetailsLoadingFailedState extends OrderDetailsState {}
