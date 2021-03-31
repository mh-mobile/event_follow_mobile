// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_meta.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EventMeta _$_$_EventMetaFromJson(Map<String, dynamic> json) {
  return _$_EventMeta(
    currentPage: json['currentPage'] as int,
    limitValue: json['limitValue'] as int,
    totalPages: json['totalPages'] as int,
    totalCount: json['totalCount'] as int,
    eventSortType: json['eventSortType'] as String,
    timeFilterType: json['timeFilterType'] as String,
    friendsFilterType: json['friendsFilterType'] as String,
  );
}

Map<String, dynamic> _$_$_EventMetaToJson(_$_EventMeta instance) =>
    <String, dynamic>{
      'currentPage': instance.currentPage,
      'limitValue': instance.limitValue,
      'totalPages': instance.totalPages,
      'totalCount': instance.totalCount,
      'eventSortType': instance.eventSortType,
      'timeFilterType': instance.timeFilterType,
      'friendsFilterType': instance.friendsFilterType,
    };
