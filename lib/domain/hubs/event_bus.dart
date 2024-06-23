import 'package:betonchel_manager/domain/hubs/event.dart';

abstract interface class EventBus {
  Stream<Event> get eventStream;

  void publish(Event event);
}
