import 'package:event_follow/models/entities/event.dart';
import 'package:event_follow/models/entities/event_extra.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_datum.freezed.dart';
part 'event_datum.g.dart';

@freezed
abstract class EventDatum implements _$EventDatum {
  factory EventDatum({
    required Event event,
    required EventExtra extra,
  }) = _EventDatum;

  EventDatum._();

  factory EventDatum.fromJson(Map<String, dynamic> json) => EventDatum(
        event: Event.fromJson(json["event"]),
        extra: EventExtra.fromJson(json["extra"]),
      );
}
