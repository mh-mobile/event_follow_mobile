import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_meta.freezed.dart';
part 'event_meta.g.dart';

@freezed
abstract class EventMeta implements _$EventMeta {
  factory EventMeta({
    required int currentPage,
    required int limitValue,
    required int totalPages,
    required int totalCount,
    required String eventSortType,
    required String timeFilterType,
    required String friendsFilterType,
  }) = _EventMeta;

  EventMeta._();

  factory EventMeta.fromJson(Map<String, dynamic> json) => EventMeta(
        currentPage: json['current_page'] as int,
        limitValue: json['limit_value'] as int,
        totalPages: json['total_pages'] as int,
        totalCount: json['total_count'] as int,
        eventSortType: json['event_sort_type'] as String,
        timeFilterType: json['time_filter_type'] as String,
        friendsFilterType: json['friends_filter_type'] as String,
      );
}
