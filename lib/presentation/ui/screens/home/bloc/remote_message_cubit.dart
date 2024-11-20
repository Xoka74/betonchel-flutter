import 'dart:async';

import 'package:betonchel_manager/presentation/ui/components/cubits/base/initializable_cubit.dart';
import 'package:betonchel_manager/presentation/ui/screens/home/bloc/remote_message_state.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:injectable/injectable.dart';

@injectable
class RemoteMessageCubit extends InitializableCubit<RemoteMessageState> {
  late final StreamSubscription _subscription;

  RemoteMessageCubit() : super(RemoteMessageIdleState());

  @override
  Future<void> initialize() async {
    _subscription = FirebaseMessaging.onMessageOpenedApp.listen(_onRemoteMessage);

    final message = await FirebaseMessaging.instance.getInitialMessage();

    if (message == null) {
      return;
    }

    return _onRemoteMessage(message);
  }

  Future<void> _onRemoteMessage(RemoteMessage message) async {
    if (!message.data.containsKey('order_id')) {
      return;
    }
    final orderId = int.tryParse(message.data['order_id']);

    if (orderId != null) {
      emit(RemoteMessageReceivedState(orderId));
    }
  }

  @override
  Future<void> close() async {
    _subscription.cancel();

    super.close();
  }
}
