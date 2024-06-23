import 'dart:async';

import 'package:betonchel_manager/domain/hubs/event.dart';
import 'package:betonchel_manager/domain/hubs/event_bus.dart';
import 'package:betonchel_manager/domain/repositories/concrete_grades_repository.dart';
import 'package:betonchel_manager/presentation/ui/components/cubits/base/initializable_cubit.dart';
import 'package:betonchel_manager/presentation/ui/screens/concrete_grade/concrete_grade_list/bloc/concrete_grade_list_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class ConcreteGradeListCubit extends InitializableCubit<ConcreteGradeListState> {
  final ConcreteGradesRepository _concreteGradesRepository;
  final EventBus _eventBus;
  late final StreamSubscription<Event> _subscription;

  ConcreteGradeListCubit(
    this._concreteGradesRepository,
    this._eventBus,
  ) : super(ConcreteGradeListLoadingState());

  @override
  Future<void> initialize() {
    _subscription = _eventBus.eventStream.listen(_onEvent);
    return loadConcreteGrades();
  }

  Future<void> _onEvent(Event event) async {
    if (event is ConcreteGradeEvent) {
      await loadConcreteGrades();
    }
  }

  Future<void> loadConcreteGrades() async {
    emit(ConcreteGradeListLoadingState());
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      final concreteGrades = await _concreteGradesRepository.getConcreteGrades();
      emit(ConcreteGradeListLoadedState(concreteGrades));
    } catch (e) {
      emit(ConcreteGradeListErrorState(e.toString()));
    }
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}
