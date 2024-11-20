import 'package:betonchel_manager/common/error_handler.dart';
import 'package:betonchel_manager/common/cancelable_runner.dart';
import 'package:betonchel_manager/domain/repositories/orders_repository.dart';
import 'package:betonchel_manager/presentation/ui/components/cubits/base/initializable_cubit.dart';
import 'package:betonchel_manager/presentation/ui/screens/order/order_details/bloc/order_details_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class OrderDetailsCubit extends InitializableCubit<OrderDetailsState> with CancelableRunner {
  final int _orderId;
  final OrdersRepository _ordersRepository;
  final ErrorHandler _errorHandler;

  OrderDetailsCubit(
    @factoryParam this._orderId,
    this._ordersRepository,
    this._errorHandler,
  ) : super(OrderDetailsLoadingState());

  @override
  Future<void> initialize() => loadApplication();

  Future<void> loadApplication() async => runScoped(_loadApplication());

  Future<void> _loadApplication() async {
    emit(OrderDetailsLoadingState());

    try {
      final application = await _ordersRepository.getOrderById(_orderId);
      emit(OrderDetailsLoadedState(application));
    } catch (e, stackTrace) {
      _errorHandler.handleError(
        e,
        stackTrace: stackTrace,
      );

      emit(OrderDetailsLoadingFailedState());
    }
  }
}
