import 'package:betonchel_manager/common/error_handler.dart';
import 'package:betonchel_manager/domain/models/order/order_filters.dart';
import 'package:betonchel_manager/domain/repositories/orders_repository.dart';
import 'package:betonchel_manager/presentation/ui/components/cubits/base/initializable_cubit.dart';
import 'package:betonchel_manager/presentation/ui/screens/order/orders_map/map/bloc/orders_map_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class OrdersMapCubit extends InitializableCubit<OrdersMapState> {
  final OrdersRepository _ordersRepository;
  final ErrorHandler _errorHandler;
  final DateTime _date;

  OrdersMapCubit(
    @factoryParam this._date,
    this._ordersRepository,
    this._errorHandler,
  ) : super(OrdersMapLoadingState());

  @override
  Future<void> initialize() => loadOrders();

  Future<void> loadOrders() async {
    emit(OrdersMapLoadingState());
    try {
      final orders = await _ordersRepository.getOrders(
        OrderFilters(deliveryDate: _date),
      );

      emit(OrdersMapLoadedState(orders));
    } catch (err) {
      _errorHandler.handleError(err);
      emit(OrdersMapErrorState());
    }
  }
}
