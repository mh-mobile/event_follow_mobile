// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Event _$EventFromJson(Map<String, dynamic> json) {
  return _Event.fromJson(json);
}

/// @nodoc
class _$EventTearOff {
  const _$EventTearOff();

  _Event call(
      {required int id,
      required int siteId,
      required int siteEventId,
      required String title,
      required DateTime startedAt,
      required DateTime endedAt,
      required String banner,
      required String url,
      required String description}) {
    return _Event(
      id: id,
      siteId: siteId,
      siteEventId: siteEventId,
      title: title,
      startedAt: startedAt,
      endedAt: endedAt,
      banner: banner,
      url: url,
      description: description,
    );
  }

  Event fromJson(Map<String, Object> json) {
    return Event.fromJson(json);
  }
}

/// @nodoc
const $Event = _$EventTearOff();

/// @nodoc
mixin _$Event {
  int get id => throw _privateConstructorUsedError;
  int get siteId => throw _privateConstructorUsedError;
  int get siteEventId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  DateTime get startedAt => throw _privateConstructorUsedError;
  DateTime get endedAt => throw _privateConstructorUsedError;
  String get banner => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EventCopyWith<Event> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventCopyWith<$Res> {
  factory $EventCopyWith(Event value, $Res Function(Event) then) =
      _$EventCopyWithImpl<$Res>;
  $Res call(
      {int id,
      int siteId,
      int siteEventId,
      String title,
      DateTime startedAt,
      DateTime endedAt,
      String banner,
      String url,
      String description});
}

/// @nodoc
class _$EventCopyWithImpl<$Res> implements $EventCopyWith<$Res> {
  _$EventCopyWithImpl(this._value, this._then);

  final Event _value;
  // ignore: unused_field
  final $Res Function(Event) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? siteId = freezed,
    Object? siteEventId = freezed,
    Object? title = freezed,
    Object? startedAt = freezed,
    Object? endedAt = freezed,
    Object? banner = freezed,
    Object? url = freezed,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      siteId: siteId == freezed
          ? _value.siteId
          : siteId // ignore: cast_nullable_to_non_nullable
              as int,
      siteEventId: siteEventId == freezed
          ? _value.siteEventId
          : siteEventId // ignore: cast_nullable_to_non_nullable
              as int,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      startedAt: startedAt == freezed
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endedAt: endedAt == freezed
          ? _value.endedAt
          : endedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      banner: banner == freezed
          ? _value.banner
          : banner // ignore: cast_nullable_to_non_nullable
              as String,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$EventCopyWith<$Res> implements $EventCopyWith<$Res> {
  factory _$EventCopyWith(_Event value, $Res Function(_Event) then) =
      __$EventCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      int siteId,
      int siteEventId,
      String title,
      DateTime startedAt,
      DateTime endedAt,
      String banner,
      String url,
      String description});
}

/// @nodoc
class __$EventCopyWithImpl<$Res> extends _$EventCopyWithImpl<$Res>
    implements _$EventCopyWith<$Res> {
  __$EventCopyWithImpl(_Event _value, $Res Function(_Event) _then)
      : super(_value, (v) => _then(v as _Event));

  @override
  _Event get _value => super._value as _Event;

  @override
  $Res call({
    Object? id = freezed,
    Object? siteId = freezed,
    Object? siteEventId = freezed,
    Object? title = freezed,
    Object? startedAt = freezed,
    Object? endedAt = freezed,
    Object? banner = freezed,
    Object? url = freezed,
    Object? description = freezed,
  }) {
    return _then(_Event(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      siteId: siteId == freezed
          ? _value.siteId
          : siteId // ignore: cast_nullable_to_non_nullable
              as int,
      siteEventId: siteEventId == freezed
          ? _value.siteEventId
          : siteEventId // ignore: cast_nullable_to_non_nullable
              as int,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      startedAt: startedAt == freezed
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endedAt: endedAt == freezed
          ? _value.endedAt
          : endedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      banner: banner == freezed
          ? _value.banner
          : banner // ignore: cast_nullable_to_non_nullable
              as String,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_Event extends _Event {
  _$_Event(
      {required this.id,
      required this.siteId,
      required this.siteEventId,
      required this.title,
      required this.startedAt,
      required this.endedAt,
      required this.banner,
      required this.url,
      required this.description})
      : super._();

  factory _$_Event.fromJson(Map<String, dynamic> json) =>
      _$_$_EventFromJson(json);

  @override
  final int id;
  @override
  final int siteId;
  @override
  final int siteEventId;
  @override
  final String title;
  @override
  final DateTime startedAt;
  @override
  final DateTime endedAt;
  @override
  final String banner;
  @override
  final String url;
  @override
  final String description;

  @override
  String toString() {
    return 'Event(id: $id, siteId: $siteId, siteEventId: $siteEventId, title: $title, startedAt: $startedAt, endedAt: $endedAt, banner: $banner, url: $url, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Event &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.siteId, siteId) ||
                const DeepCollectionEquality().equals(other.siteId, siteId)) &&
            (identical(other.siteEventId, siteEventId) ||
                const DeepCollectionEquality()
                    .equals(other.siteEventId, siteEventId)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.startedAt, startedAt) ||
                const DeepCollectionEquality()
                    .equals(other.startedAt, startedAt)) &&
            (identical(other.endedAt, endedAt) ||
                const DeepCollectionEquality()
                    .equals(other.endedAt, endedAt)) &&
            (identical(other.banner, banner) ||
                const DeepCollectionEquality().equals(other.banner, banner)) &&
            (identical(other.url, url) ||
                const DeepCollectionEquality().equals(other.url, url)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(siteId) ^
      const DeepCollectionEquality().hash(siteEventId) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(startedAt) ^
      const DeepCollectionEquality().hash(endedAt) ^
      const DeepCollectionEquality().hash(banner) ^
      const DeepCollectionEquality().hash(url) ^
      const DeepCollectionEquality().hash(description);

  @JsonKey(ignore: true)
  @override
  _$EventCopyWith<_Event> get copyWith =>
      __$EventCopyWithImpl<_Event>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_EventToJson(this);
  }
}

abstract class _Event extends Event {
  factory _Event(
      {required int id,
      required int siteId,
      required int siteEventId,
      required String title,
      required DateTime startedAt,
      required DateTime endedAt,
      required String banner,
      required String url,
      required String description}) = _$_Event;
  _Event._() : super._();

  factory _Event.fromJson(Map<String, dynamic> json) = _$_Event.fromJson;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  int get siteId => throw _privateConstructorUsedError;
  @override
  int get siteEventId => throw _privateConstructorUsedError;
  @override
  String get title => throw _privateConstructorUsedError;
  @override
  DateTime get startedAt => throw _privateConstructorUsedError;
  @override
  DateTime get endedAt => throw _privateConstructorUsedError;
  @override
  String get banner => throw _privateConstructorUsedError;
  @override
  String get url => throw _privateConstructorUsedError;
  @override
  String get description => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$EventCopyWith<_Event> get copyWith => throw _privateConstructorUsedError;
}
