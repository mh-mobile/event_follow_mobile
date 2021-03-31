// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Event _$_$_EventFromJson(Map<String, dynamic> json) {
  return _$_Event(
    id: json['id'] as int,
    siteId: json['siteId'] as int,
    siteEventId: json['siteEventId'] as int,
    title: json['title'] as String,
    startedAt: DateTime.parse(json['startedAt'] as String),
    endedAt: DateTime.parse(json['endedAt'] as String),
    banner: json['banner'] as String,
    url: json['url'] as String,
    description: json['description'] as String,
  );
}

Map<String, dynamic> _$_$_EventToJson(_$_Event instance) => <String, dynamic>{
      'id': instance.id,
      'siteId': instance.siteId,
      'siteEventId': instance.siteEventId,
      'title': instance.title,
      'startedAt': instance.startedAt.toIso8601String(),
      'endedAt': instance.endedAt.toIso8601String(),
      'banner': instance.banner,
      'url': instance.url,
      'description': instance.description,
    };
