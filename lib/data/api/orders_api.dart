import 'package:betonchel_manager/domain/models/error/operation_status.dart';
import 'package:betonchel_manager/domain/models/filters/order_filters.dart';
import 'package:betonchel_manager/domain/models/order/order.dart';
import 'package:betonchel_manager/domain/models/order/order_data.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart' hide Order;
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'orders_api.g.dart';

@RestApi()
@injectable
abstract class OrdersApi {
  @factoryMethod
  factory OrdersApi(Dio dio) = _OrdersApi;

  @GET('orders')
  Future<List<Order>> getOrders(@Queries() OrderFilters filters);

  @GET('orders/{id}')
  Future<Order> getOrderById(@Path() int id);

  @POST('orders')
  Future<Order> createOrder(@Body() OrderData data);

  @PUT('orders/{id}')
  Future<Order> editOrder(@Path() int id, @Body() OrderData data);

  @DELETE('orders/{id}')
  Future<OperationStatus> deleteOrder(@Path() int id);
}
