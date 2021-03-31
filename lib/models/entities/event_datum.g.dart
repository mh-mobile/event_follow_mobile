// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_datum.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EventDatum _$_$_EventDatumFromJson(Map<String, dynamic> json) {
  return _$_EventDatum(
    event: Event.fromJson(json['event'] as Map<String, dynamic>),
    extra: EventExtra.fromJson(json['extra'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_EventDatumToJson(_$_EventDatum instance) =>
    <String, dynamic>{
      'event': instance.event,
      'extra': instance.extra,
    };
