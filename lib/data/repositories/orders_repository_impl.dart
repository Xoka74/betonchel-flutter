import 'package:betonchel_manager/data/api/orders_api.dart';
import 'package:betonchel_manager/data/repositories/base_repository.dart';
import 'package:betonchel_manager/domain/hubs/event.dart';
import 'package:betonchel_manager/domain/hubs/event_bus.dart';
import 'package:betonchel_manager/domain/models/error/operation_status.dart';
import 'package:betonchel_manager/domain/models/order/order_filters.dart';
import 'package:betonchel_manager/domain/models/order/order.dart';
import 'package:betonchel_manager/domain/models/order/order_data.dart';
import 'package:betonchel_manager/domain/repositories/orders_repository.dart';
import 'package:injectable/injectable.dart' hide Order;

@Injectable(as: OrdersRepository)
class OrdersRepositoryImpl extends BaseRepository implements OrdersRepository {
  final OrdersApi _ordersApi;
  final EventBus _eventBus;

  OrdersRepositoryImpl(
    this._ordersApi,
    this._eventBus,
    super._tokenVerifier,
  );

  @override
  Future<void> createOrder(OrderData data) => withTokenVerification(
        () async {
          final result = await _ordersApi.createOrder(data);
          _eventBus.publish(ApplicationCreatedEvent());
          return result;
        },
      );

  @override
  Future<void> editOrder(int id, OrderData data) => withTokenVerification(() async {
        final result = await _ordersApi.editOrder(id, data);
        _eventBus.publish(ApplicationUpdatedEvent());
        return result;
      });

  @override
  Future<OperationStatus> deleteOrder(int id) => withTokenVerification(() => _ordersApi.deleteOrder(id));

  @override
  Future<Order> getOrderById(int id) => withTokenVerification(
        () async {
          final result = await _ordersApi.getOrderById(id);

          return result;
        },
      );

  @override
  Future<List<Order>> getOrders(OrderFilters filters) => withTokenVerification(
        () async {
          final result = await _ordersApi.getOrders(filters);

          return result;
        },
      );
}
