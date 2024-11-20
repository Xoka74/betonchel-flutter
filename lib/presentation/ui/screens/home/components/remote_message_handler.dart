import 'package:auto_route/auto_route.dart';
import 'package:betonchel_manager/navigation/web_router.gr.dart';
import 'package:betonchel_manager/presentation/ui/screens/home/bloc/remote_message_cubit.dart';
import 'package:betonchel_manager/presentation/ui/screens/home/bloc/remote_message_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RemoteMessageHandler extends StatelessWidget {
  final Widget child;

  const RemoteMessageHandler({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) => BlocListener<RemoteMessageCubit, RemoteMessageState>(
        listener: _listenRemoteMessageCubit,
        child: child,
      );

  Future<void> _listenRemoteMessageCubit(
    BuildContext context,
    RemoteMessageState state,
  ) async {
    if (state is RemoteMessageReceivedState) {
      final orderId = state.orderId;

      await context.navigateTo(OrderDetailsPage(id: orderId));
    }
  }
}
