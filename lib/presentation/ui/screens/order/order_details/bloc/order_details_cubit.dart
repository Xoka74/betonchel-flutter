import 'package:async/async.dart';
import 'package:betonchel_manager/domain/repositories/orders_repository.dart';
import 'package:betonchel_manager/presentation/ui/components/cubits/base/initializable_cubit.dart';
import 'package:betonchel_manager/presentation/ui/screens/order/order_details/bloc/order_details_state.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@injectable
class OrderDetailsCubit extends InitializableCubit<OrderDetailsState> {
  final int _orderId;
  final OrdersRepository _ordersRepository;
  final Logger _logger;

  CancelableOperation? _loadApplicationOperation;

  OrderDetailsCubit(
    @factoryParam this._orderId,
    this._ordersRepository,
    this._logger,
  ) : super(OrderDetailsLoadingState());

  @override
  Future<void> initialize() => loadApplication();

  Future<void> loadApplication() async {
    _loadApplicationOperation = CancelableOperation.fromFuture(_loadApplication());
    return _loadApplicationOperation?.value;
  }

  Future<void> _loadApplication() async {
    emit(OrderDetailsLoadingState());

    try {
      final application = await _ordersRepository.getOrderById(_orderId);
      emit(OrderDetailsLoadedState(application));
    } catch (e, stackTrace) {
      _logger.e(
        e,
        stackTrace: stackTrace,
      );
      emit(OrderDetailsLoadingFailedState());
    }
  }

  @override
  Future<void> close() {
    _loadApplicationOperation?.cancel();

    return super.close();
  }
}
