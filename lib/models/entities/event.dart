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
        id: json['id'] as int,
        siteId: json['site_id'] as int,
        siteEventId: json['site_event_id'] as int,
        title: json['title'] as String,
        startedAt: DateTime.parse(json['started_at'] as String),
        endedAt: DateTime.parse(json['ended_at'] as String),
        banner: json['banner'] as String,
        url: json['url'] as String,
        description: json['description'] as String,
      );
}
