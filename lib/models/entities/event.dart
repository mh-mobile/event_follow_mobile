import 'package:freezed_annotation/freezed_annotation.dart';

part 'event.freezed.dart';
part 'event.g.dart';

@freezed
abstract class Event implements _$Event {
  factory Event({
    required int id,
    required int siteId,
    required int siteEventId,
    required String title,
    required DateTime startedAt,
    required DateTime endedAt,
    required String banner,
    required String url,
    required String description,
  }) = _Event;

  Event._();

  factory Event.fromJson(Map<String, dynamic> json) => Event(
        id: json['id'],
        siteId: json['site_id'],
        siteEventId: json['site_event_id'],
        title: json['title'],
        startedAt: DateTime.parse(json['started_at']),
        endedAt: DateTime.parse(json['ended_at']),
        banner: json['banner'],
        url: json['url'],
        description: json['description'],
      );
}
