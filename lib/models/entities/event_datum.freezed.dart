// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'event_datum.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EventDatum _$EventDatumFromJson(Map<String, dynamic> json) {
  return _EventDatum.fromJson(json);
}

/// @nodoc
class _$EventDatumTearOff {
  const _$EventDatumTearOff();

  _EventDatum call({required Event event, required EventExtra extra}) {
    return _EventDatum(
      event: event,
      extra: extra,
    );
  }

  EventDatum fromJson(Map<String, Object> json) {
    return EventDatum.fromJson(json);
  }
}

/// @nodoc
const $EventDatum = _$EventDatumTearOff();

/// @nodoc
mixin _$EventDatum {
  Event get event => throw _privateConstructorUsedError;
  EventExtra get extra => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EventDatumCopyWith<EventDatum> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventDatumCopyWith<$Res> {
  factory $EventDatumCopyWith(
          EventDatum value, $Res Function(EventDatum) then) =
      _$EventDatumCopyWithImpl<$Res>;
  $Res call({Event event, EventExtra extra});

  $EventCopyWith<$Res> get event;
  $EventExtraCopyWith<$Res> get extra;
}

/// @nodoc
class _$EventDatumCopyWithImpl<$Res> implements $EventDatumCopyWith<$Res> {
  _$EventDatumCopyWithImpl(this._value, this._then);

  final EventDatum _value;
  // ignore: unused_field
  final $Res Function(EventDatum) _then;

  @override
  $Res call({
    Object? event = freezed,
    Object? extra = freezed,
  }) {
    return _then(_value.copyWith(
      event: event == freezed
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as Event,
      extra: extra == freezed
          ? _value.extra
          : extra // ignore: cast_nullable_to_non_nullable
              as EventExtra,
    ));
  }

  @override
  $EventCopyWith<$Res> get event {
    return $EventCopyWith<$Res>(_value.event, (value) {
      return _then(_value.copyWith(event: value));
    });
  }

  @override
  $EventExtraCopyWith<$Res> get extra {
    return $EventExtraCopyWith<$Res>(_value.extra, (value) {
      return _then(_value.copyWith(extra: value));
    });
  }
}

/// @nodoc
abstract class _$EventDatumCopyWith<$Res> implements $EventDatumCopyWith<$Res> {
  factory _$EventDatumCopyWith(
          _EventDatum value, $Res Function(_EventDatum) then) =
      __$EventDatumCopyWithImpl<$Res>;
  @override
  $Res call({Event event, EventExtra extra});

  @override
  $EventCopyWith<$Res> get event;
  @override
  $EventExtraCopyWith<$Res> get extra;
}

/// @nodoc
class __$EventDatumCopyWithImpl<$Res> extends _$EventDatumCopyWithImpl<$Res>
    implements _$EventDatumCopyWith<$Res> {
  __$EventDatumCopyWithImpl(
      _EventDatum _value, $Res Function(_EventDatum) _then)
      : super(_value, (v) => _then(v as _EventDatum));

  @override
  _EventDatum get _value => super._value as _EventDatum;

  @override
  $Res call({
    Object? event = freezed,
    Object? extra = freezed,
  }) {
    return _then(_EventDatum(
      event: event == freezed
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as Event,
      extra: extra == freezed
          ? _value.extra
          : extra // ignore: cast_nullable_to_non_nullable
              as EventExtra,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_EventDatum extends _EventDatum {
  _$_EventDatum({required this.event, required this.extra}) : super._();

  factory _$_EventDatum.fromJson(Map<String, dynamic> json) =>
      _$_$_EventDatumFromJson(json);

  @override
  final Event event;
  @override
  final EventExtra extra;

  @override
  String toString() {
    return 'EventDatum(event: $event, extra: $extra)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _EventDatum &&
            (identical(other.event, event) ||
                const DeepCollectionEquality().equals(other.event, event)) &&
            (identical(other.extra, extra) ||
                const DeepCollectionEquality().equals(other.extra, extra)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(event) ^
      const DeepCollectionEquality().hash(extra);

  @JsonKey(ignore: true)
  @override
  _$EventDatumCopyWith<_EventDatum> get copyWith =>
      __$EventDatumCopyWithImpl<_EventDatum>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_EventDatumToJson(this);
  }
}

abstract class _EventDatum extends EventDatum {
  factory _EventDatum({required Event event, required EventExtra extra}) =
      _$_EventDatum;
  _EventDatum._() : super._();

  factory _EventDatum.fromJson(Map<String, dynamic> json) =
      _$_EventDatum.fromJson;

  @override
  Event get event => throw _privateConstructorUsedError;
  @override
  EventExtra get extra => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$EventDatumCopyWith<_EventDatum> get copyWith =>
      throw _privateConstructorUsedError;
}
