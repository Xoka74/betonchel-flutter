import 'dart:async';

import 'package:betonchel_manager/domain/hubs/event.dart';
import 'package:betonchel_manager/domain/hubs/event_bus.dart';
import 'package:betonchel_manager/domain/models/user/user_filters.dart';
import 'package:betonchel_manager/domain/repositories/users_repository.dart';
import 'package:betonchel_manager/presentation/ui/components/cubits/base/initializable_cubit.dart';
import 'package:betonchel_manager/presentation/ui/screens/users/users_list/bloc/users_list_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class UsersListCubit extends InitializableCubit<UsersListState> {
  final UsersRepository _usersRepository;
  final EventBus _eventBus;

  late final StreamSubscription<Event> _subscription;

  UsersListCubit(
    this._usersRepository,
    this._eventBus,
  ) : super(UsersListLoadingState());

  @override
  Future<void> initialize() async {
    _subscription = _eventBus.eventStream.listen(_onEvent);
    await _loadEmployees();
  }

  Future<void> _onEvent(Event event) async {
    await _loadEmployees();
  }

  Future<void> _loadEmployees() async {
    emit(UsersListLoadingState());
    try {
      final employees = await _usersRepository.getUsers(UserFilters());
      emit(UsersListLoadedState(employees));
    } catch (e) {
      emit(UsersListErrorState());
    }
  }

  @override
  Future<void> close() {
    _subscription.cancel();

    return super.close();
  }
}
