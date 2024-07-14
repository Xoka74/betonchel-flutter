import 'dart:async';

import 'package:betonchel_manager/domain/hubs/event.dart';
import 'package:betonchel_manager/domain/hubs/event_bus.dart';
import 'package:betonchel_manager/domain/repositories/users_repository.dart';
import 'package:betonchel_manager/presentation/ui/components/cubits/base/initializable_cubit.dart';
import 'package:betonchel_manager/presentation/ui/screens/employees/employees_list/bloc/employees_list_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class EmployeesListCubit extends InitializableCubit<EmployeesListState> {
  final EmployeesRepository _employeesRepository;
  final EventBus _eventBus;

  late final StreamSubscription<Event> _subscription;

  EmployeesListCubit(
    this._employeesRepository,
    this._eventBus,
  ) : super(EmployeesListLoadingState());

  @override
  Future<void> initialize() async {
    _subscription = _eventBus.eventStream.listen(_onEvent);
    await _loadEmployees();
  }

  Future<void> _onEvent(Event event) async {
    await _loadEmployees();
  }

  Future<void> _loadEmployees() async {
    emit(EmployeesListLoadingState());
    try {
      final employees = await _employeesRepository.getEmployees();
      emit(EmployeesListLoadedState(employees));
    } catch (e) {
      emit(EmployeesListErrorState());
    }
  }

  @override
  Future<void> close() {
    _subscription.cancel();

    return super.close();
  }
}
