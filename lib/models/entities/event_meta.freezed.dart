// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'event_meta.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EventMeta _$EventMetaFromJson(Map<String, dynamic> json) {
  return _EventMeta.fromJson(json);
}

/// @nodoc
class _$EventMetaTearOff {
  const _$EventMetaTearOff();

  _EventMeta call(
      {required int currentPage,
      required int limitValue,
      required int totalPages,
      required int totalCount,
      required String eventSortType,
      required String timeFilterType,
      required String friendsFilterType}) {
    return _EventMeta(
      currentPage: currentPage,
      limitValue: limitValue,
      totalPages: totalPages,
      totalCount: totalCount,
      eventSortType: eventSortType,
      timeFilterType: timeFilterType,
      friendsFilterType: friendsFilterType,
    );
  }

  EventMeta fromJson(Map<String, Object> json) {
    return EventMeta.fromJson(json);
  }
}

/// @nodoc
const $EventMeta = _$EventMetaTearOff();

/// @nodoc
mixin _$EventMeta {
  int get currentPage => throw _privateConstructorUsedError;
  int get limitValue => throw _privateConstructorUsedError;
  int get totalPages => throw _privateConstructorUsedError;
  int get totalCount => throw _privateConstructorUsedError;
  String get eventSortType => throw _privateConstructorUsedError;
  String get timeFilterType => throw _privateConstructorUsedError;
  String get friendsFilterType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EventMetaCopyWith<EventMeta> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventMetaCopyWith<$Res> {
  factory $EventMetaCopyWith(EventMeta value, $Res Function(EventMeta) then) =
      _$EventMetaCopyWithImpl<$Res>;
  $Res call(
      {int currentPage,
      int limitValue,
      int totalPages,
      int totalCount,
      String eventSortType,
      String timeFilterType,
      String friendsFilterType});
}

/// @nodoc
class _$EventMetaCopyWithImpl<$Res> implements $EventMetaCopyWith<$Res> {
  _$EventMetaCopyWithImpl(this._value, this._then);

  final EventMeta _value;
  // ignore: unused_field
  final $Res Function(EventMeta) _then;

  @override
  $Res call({
    Object? currentPage = freezed,
    Object? limitValue = freezed,
    Object? totalPages = freezed,
    Object? totalCount = freezed,
    Object? eventSortType = freezed,
    Object? timeFilterType = freezed,
    Object? friendsFilterType = freezed,
  }) {
    return _then(_value.copyWith(
      currentPage: currentPage == freezed
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      limitValue: limitValue == freezed
          ? _value.limitValue
          : limitValue // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: totalPages == freezed
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      totalCount: totalCount == freezed
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      eventSortType: eventSortType == freezed
          ? _value.eventSortType
          : eventSortType // ignore: cast_nullable_to_non_nullable
              as String,
      timeFilterType: timeFilterType == freezed
          ? _value.timeFilterType
          : timeFilterType // ignore: cast_nullable_to_non_nullable
              as String,
      friendsFilterType: friendsFilterType == freezed
          ? _value.friendsFilterType
          : friendsFilterType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$EventMetaCopyWith<$Res> implements $EventMetaCopyWith<$Res> {
  factory _$EventMetaCopyWith(
          _EventMeta value, $Res Function(_EventMeta) then) =
      __$EventMetaCopyWithImpl<$Res>;
  @override
  $Res call(
      {int currentPage,
      int limitValue,
      int totalPages,
      int totalCount,
      String eventSortType,
      String timeFilterType,
      String friendsFilterType});
}

/// @nodoc
class __$EventMetaCopyWithImpl<$Res> extends _$EventMetaCopyWithImpl<$Res>
    implements _$EventMetaCopyWith<$Res> {
  __$EventMetaCopyWithImpl(_EventMeta _value, $Res Function(_EventMeta) _then)
      : super(_value, (v) => _then(v as _EventMeta));

  @override
  _EventMeta get _value => super._value as _EventMeta;

  @override
  $Res call({
    Object? currentPage = freezed,
    Object? limitValue = freezed,
    Object? totalPages = freezed,
    Object? totalCount = freezed,
    Object? eventSortType = freezed,
    Object? timeFilterType = freezed,
    Object? friendsFilterType = freezed,
  }) {
    return _then(_EventMeta(
      currentPage: currentPage == freezed
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      limitValue: limitValue == freezed
          ? _value.limitValue
          : limitValue // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: totalPages == freezed
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      totalCount: totalCount == freezed
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      eventSortType: eventSortType == freezed
          ? _value.eventSortType
          : eventSortType // ignore: cast_nullable_to_non_nullable
              as String,
      timeFilterType: timeFilterType == freezed
          ? _value.timeFilterType
          : timeFilterType // ignore: cast_nullable_to_non_nullable
              as String,
      friendsFilterType: friendsFilterType == freezed
          ? _value.friendsFilterType
          : friendsFilterType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_EventMeta extends _EventMeta {
  _$_EventMeta(
      {required this.currentPage,
      required this.limitValue,
      required this.totalPages,
      required this.totalCount,
      required this.eventSortType,
      required this.timeFilterType,
      required this.friendsFilterType})
      : super._();

  factory _$_EventMeta.fromJson(Map<String, dynamic> json) =>
      _$_$_EventMetaFromJson(json);

  @override
  final int currentPage;
  @override
  final int limitValue;
  @override
  final int totalPages;
  @override
  final int totalCount;
  @override
  final String eventSortType;
  @override
  final String timeFilterType;
  @override
  final String friendsFilterType;

  @override
  String toString() {
    return 'EventMeta(currentPage: $currentPage, limitValue: $limitValue, totalPages: $totalPages, totalCount: $totalCount, eventSortType: $eventSortType, timeFilterType: $timeFilterType, friendsFilterType: $friendsFilterType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _EventMeta &&
            (identical(other.currentPage, currentPage) ||
                const DeepCollectionEquality()
                    .equals(other.currentPage, currentPage)) &&
            (identical(other.limitValue, limitValue) ||
                const DeepCollectionEquality()
                    .equals(other.limitValue, limitValue)) &&
            (identical(other.totalPages, totalPages) ||
                const DeepCollectionEquality()
                    .equals(other.totalPages, totalPages)) &&
            (identical(other.totalCount, totalCount) ||
                const DeepCollectionEquality()
                    .equals(other.totalCount, totalCount)) &&
            (identical(other.eventSortType, eventSortType) ||
                const DeepCollectionEquality()
                    .equals(other.eventSortType, eventSortType)) &&
            (identical(other.timeFilterType, timeFilterType) ||
                const DeepCollectionEquality()
                    .equals(other.timeFilterType, timeFilterType)) &&
            (identical(other.friendsFilterType, friendsFilterType) ||
                const DeepCollectionEquality()
                    .equals(other.friendsFilterType, friendsFilterType)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(currentPage) ^
      const DeepCollectionEquality().hash(limitValue) ^
      const DeepCollectionEquality().hash(totalPages) ^
      const DeepCollectionEquality().hash(totalCount) ^
      const DeepCollectionEquality().hash(eventSortType) ^
      const DeepCollectionEquality().hash(timeFilterType) ^
      const DeepCollectionEquality().hash(friendsFilterType);

  @JsonKey(ignore: true)
  @override
  _$EventMetaCopyWith<_EventMeta> get copyWith =>
      __$EventMetaCopyWithImpl<_EventMeta>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_EventMetaToJson(this);
  }
}

abstract class _EventMeta extends EventMeta {
  factory _EventMeta(
      {required int currentPage,
      required int limitValue,
      required int totalPages,
      required int totalCount,
      required String eventSortType,
      required String timeFilterType,
      required String friendsFilterType}) = _$_EventMeta;
  _EventMeta._() : super._();

  factory _EventMeta.fromJson(Map<String, dynamic> json) =
      _$_EventMeta.fromJson;

  @override
  int get currentPage => throw _privateConstructorUsedError;
  @override
  int get limitValue => throw _privateConstructorUsedError;
  @override
  int get totalPages => throw _privateConstructorUsedError;
  @override
  int get totalCount => throw _privateConstructorUsedError;
  @override
  String get eventSortType => throw _privateConstructorUsedError;
  @override
  String get timeFilterType => throw _privateConstructorUsedError;
  @override
  String get friendsFilterType => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$EventMetaCopyWith<_EventMeta> get copyWith =>
      throw _privateConstructorUsedError;
}
