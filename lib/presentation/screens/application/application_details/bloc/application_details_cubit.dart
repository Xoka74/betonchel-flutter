import 'package:async/async.dart';
import 'package:betonchel_manager/domain/repositories/applications_repository.dart';
import 'package:betonchel_manager/presentation/components/cubits/base/initializable_cubit.dart';
import 'package:betonchel_manager/presentation/screens/application/application_details/bloc/application_details_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class ApplicationDetailsCubit extends InitializableCubit<ApplicationDetailsState> {
  final ApplicationsRepository _applicationsRepository;
  final int _applicationId;

  CancelableOperation? _loadApplicationOperation;

  ApplicationDetailsCubit(
    @factoryParam this._applicationId,
    this._applicationsRepository,
  ) : super(ApplicationDetailsLoadingState());

  @override
  Future<void> initialize() => loadApplication();

  Future<void> loadApplication() async {
    _loadApplicationOperation = CancelableOperation.fromFuture(_loadApplication());
    return _loadApplicationOperation?.value;
  }

  Future<void> _loadApplication() async {
    emit(ApplicationDetailsLoadingState());

    try {
      final application = await _applicationsRepository.getApplicationById(_applicationId);
      emit(ApplicationDetailsLoadedState(application));
    } catch (e) {
      emit(ApplicationDetailsLoadingFailedState());
    }
  }

  @override
  Future<void> close() {
    _loadApplicationOperation?.cancel();

    return super.close();
  }
}
