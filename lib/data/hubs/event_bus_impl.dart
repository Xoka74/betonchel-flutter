import 'dart:async';

import 'package:betonchel_manager/domain/hubs/event.dart';
import 'package:betonchel_manager/domain/hubs/event_bus.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: EventBus)
class EventBusImpl implements EventBus {
  final _eventsController = StreamController<Event>.broadcast();

  @override
  Stream<Event> get eventStream => _eventsController.stream;

  @override
  void publish(Event event) => _eventsController.add(event);
}
