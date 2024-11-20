sealed class RemoteMessageState {}

class RemoteMessageIdleState extends RemoteMessageState {}

class RemoteMessageReceivedState extends RemoteMessageState {
  final int orderId;

  RemoteMessageReceivedState(this.orderId);
}
