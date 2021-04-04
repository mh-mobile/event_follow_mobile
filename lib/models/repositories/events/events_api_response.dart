import 'package:event_follow/models/entities/event_datum.dart';
import 'package:event_follow/models/entities/event_meta.dart';

class EventsApiResponse {
  EventsApiResponse({
    required this.meta,
    required this.data,
  });

  factory EventsApiResponse.fromJson(Map<String, dynamic> json) =>
      EventsApiResponse(
        meta: EventMeta.fromJson(json['meta']),
        data: List<EventDatum>.from(
            json['data'].map((x) => EventDatum.fromJson(x))),
      );

  EventMeta meta;
  List<EventDatum> data;

  Map<String, dynamic> toJson() => {
        'meta': meta.toJson(),
        'data': List<dynamic>.from(data.map((x) => x.toJson())),
      };
}
