import 'package:event_follow/models/entities/event_datum.dart';
import 'package:event_follow/models/entities/event_meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'events_status.dart';

part 'events_state.freezed.dart';

@freezed
abstract class EventsState with _$EventsState {
  factory EventsState({
    @Default(<EventDatum>[]) List<EventDatum> data,
    @Default(null) EventMeta? meta,
    @Default(EventsEmpty()) EventsStatus status,
  }) = _EventsState;

  EventsState._();
}
