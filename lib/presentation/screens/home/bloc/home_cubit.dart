import 'package:betonchel_manager/domain/repositories/applications_repository.dart';
import 'package:betonchel_manager/presentation/components/cubits/base/initializable_cubit.dart';
import 'package:betonchel_manager/presentation/components/date_pickers/date_controller.dart';
import 'package:betonchel_manager/presentation/screens/home/bloc/home_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeCubit extends InitializableCubit<HomeState> {
  final ApplicationsRepository _applicationsRepository;

  final datetimeController = DateController(
    DateTime.now(),
    minDate: DateTime.now().subtract(_deltaTime),
    maxDate: DateTime.now().add(_deltaTime),
  );

  HomeCubit(this._applicationsRepository) : super(HomeLoadingState());

  @override
  Future<void> initialize() async {
    datetimeController.addListener(_updateDate);
    _updateDate();
  }

  Future<void> _updateDate() async {
    final newDate = datetimeController.value;

    if (newDate == null) {
      return;
    }

    emit(HomeLoadingState());

    try {
      final applications = await _applicationsRepository.getApplications(newDate);
      emit(HomeLoadedState(applications));
    } catch (e) {
      emit(HomeLoadingErrorState());
    }
  }

  @override
  Future<void> close() {
    datetimeController.dispose();

    return super.close();
  }

  static const _deltaTime = Duration(days: 365);
}
