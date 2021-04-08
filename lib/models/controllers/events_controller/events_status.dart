import 'package:equatable/equatable.dart';

abstract class EventsStatus extends Equatable {
  const EventsStatus();
}

class EventsEmpty extends EventsStatus {
  const EventsEmpty();

  @override
  String toString() => 'EventsEmpty';

  @override
  List<Object?> get props => [];
}

class EventsInProgress extends EventsStatus {
  const EventsInProgress();

  @override
  String toString() => 'EventsInProgress';

  @override
  List<Object?> get props => [];
}

class EventsSuccess extends EventsStatus {
  const EventsSuccess();

  @override
  String toString() => 'EventsSuccess';

  @override
  List<Object?> get props => [];
}

class EventsFailure extends EventsStatus {
  const EventsFailure();

  @override
  String toString() => 'EventsFailure';

  @override
  List<Object?> get props => [];
}
