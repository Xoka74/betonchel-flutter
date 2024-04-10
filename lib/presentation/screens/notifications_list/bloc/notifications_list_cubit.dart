import 'package:betonchel_manager/presentation/components/cubits/base/initializable_cubit.dart';
import 'package:betonchel_manager/presentation/screens/notifications_list/bloc/notifications_list_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class NotificationsListCubit extends InitializableCubit<NotificationsListState> {
  NotificationsListCubit() : super(NotificationsListLoadingState());

  @override
  Future<void> initialize() async {}


}
