import 'package:async/async.dart';
import 'package:betonchel_manager/domain/repositories/locations_repository.dart';
import 'package:betonchel_manager/presentation/ui/components/cubits/base/initializable_cubit.dart';
import 'package:betonchel_manager/presentation/ui/components/text_fields/models/text_change_notifier_controller.dart';
import 'package:betonchel_manager/presentation/ui/screens/locations/bloc/location_search_state.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@injectable
class LocationSearchCubit extends InitializableCubit<LocationSearchState> {
  final LocationsRepository _locationsRepository;
  final Logger _logger;

  final TextChangeNotifierController controller = TextChangeNotifierController();

  CancelableOperation? _searchOperation;

  LocationSearchCubit(
    this._locationsRepository,
    this._logger,
  ) : super(LocationSearchSuccessState([]));

  @override
  Future<void> initialize() async {
    controller.addTextChangeListener(_updateItems);
  }

  Future<void> _updateItems() async {
    await _cancelSearchRequestAndWaitSearchDelay();
    _searchLocation(controller.text);
  }

  Future<void> _cancelSearchRequestAndWaitSearchDelay() async {
    _searchOperation?.cancel();

    final searchRequest = CancelableOperation.fromFuture(Future.delayed(_searchDelay));
    _searchOperation = searchRequest;

    return searchRequest.value;
  }

  Future<void> _searchLocation(String query) async {
    emit(LocationSearchLoadingState());
    try {
      final locations = await _locationsRepository.searchLocation(query);

      emit(LocationSearchSuccessState(locations));
    } catch (err, stackTrace) {
      _logger.e(
        err,
        stackTrace: stackTrace,
      );
      emit(LocationSearchErrorState());
    }
  }

  @override
  Future<void> close() {
    controller.dispose();

    return super.close();
  }

  static const _searchDelay = Duration(milliseconds: 350);
}
