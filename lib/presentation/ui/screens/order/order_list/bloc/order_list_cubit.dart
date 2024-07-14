import 'dart:async';

import 'package:betonchel_manager/domain/hubs/event.dart';
import 'package:betonchel_manager/domain/hubs/event_bus.dart';
import 'package:betonchel_manager/domain/models/filters/order_filters.dart';
import 'package:betonchel_manager/domain/repositories/orders_repository.dart';
import 'package:betonchel_manager/presentation/ui/components/cubits/base/initializable_cubit.dart';
import 'package:betonchel_manager/presentation/ui/components/date_pickers/date_controller.dart';
import 'package:betonchel_manager/presentation/ui/screens/order/order_list/bloc/order_list_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class OrderListCubit extends InitializableCubit<OrderListState> {
  final OrdersRepository _applicationsRepository;
  final EventBus _eventBus;

  final datetime = DateController(
    DateTime.now(),
    minDate: DateTime.now().subtract(_deltaTime),
    maxDate: DateTime.now().add(_deltaTime),
  );

  late final StreamSubscription<Event> _subscription;

  OrderListCubit(this._applicationsRepository, this._eventBus) : super(OrderListLoadingState());

  @override
  Future<void> initialize() async {
    datetime.addListener(_loadWithSelectedDate);
    _subscription = _eventBus.eventStream.listen(_onEvent);
    await _loadWithSelectedDate();
  }

  Future<void> _onEvent(Event event) async {
    if (event is ApplicationEvent) {
      await _loadWithSelectedDate();
    }
  }

  Future<void> _loadWithSelectedDate() async {
    final currentDate = datetime.value;

    if (currentDate != null) {
      await _loadWithDate(currentDate);
    }
  }

  Future<void> _loadWithDate(DateTime date) async {
    emit(OrderListLoadingState());

    try {
      final applications = await _applicationsRepository.getOrders(OrderFilters(date: date));
      emit(OrderListLoadedState(applications));
    } catch (e) {
      emit(OrderListErrorState());
    }
  }

  @override
  Future<void> close() {
    datetime.dispose();
    _subscription.cancel();

    return super.close();
  }

  static const _deltaTime = Duration(days: 365);
}
