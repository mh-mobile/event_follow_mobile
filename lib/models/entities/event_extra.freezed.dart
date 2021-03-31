// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'event_extra.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EventExtra _$EventExtraFromJson(Map<String, dynamic> json) {
  return _EventExtra.fromJson(json);
}

/// @nodoc
class _$EventExtraTearOff {
  const _$EventExtraTearOff();

  _EventExtra call({required String userIds, required int friendsNumber}) {
    return _EventExtra(
      userIds: userIds,
      friendsNumber: friendsNumber,
    );
  }

  EventExtra fromJson(Map<String, Object> json) {
    return EventExtra.fromJson(json);
  }
}

/// @nodoc
const $EventExtra = _$EventExtraTearOff();

/// @nodoc
mixin _$EventExtra {
  String get userIds => throw _privateConstructorUsedError;
  int get friendsNumber => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EventExtraCopyWith<EventExtra> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventExtraCopyWith<$Res> {
  factory $EventExtraCopyWith(
          EventExtra value, $Res Function(EventExtra) then) =
      _$EventExtraCopyWithImpl<$Res>;
  $Res call({String userIds, int friendsNumber});
}

/// @nodoc
class _$EventExtraCopyWithImpl<$Res> implements $EventExtraCopyWith<$Res> {
  _$EventExtraCopyWithImpl(this._value, this._then);

  final EventExtra _value;
  // ignore: unused_field
  final $Res Function(EventExtra) _then;

  @override
  $Res call({
    Object? userIds = freezed,
    Object? friendsNumber = freezed,
  }) {
    return _then(_value.copyWith(
      userIds: userIds == freezed
          ? _value.userIds
          : userIds // ignore: cast_nullable_to_non_nullable
              as String,
      friendsNumber: friendsNumber == freezed
          ? _value.friendsNumber
          : friendsNumber // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$EventExtraCopyWith<$Res> implements $EventExtraCopyWith<$Res> {
  factory _$EventExtraCopyWith(
          _EventExtra value, $Res Function(_EventExtra) then) =
      __$EventExtraCopyWithImpl<$Res>;
  @override
  $Res call({String userIds, int friendsNumber});
}

/// @nodoc
class __$EventExtraCopyWithImpl<$Res> extends _$EventExtraCopyWithImpl<$Res>
    implements _$EventExtraCopyWith<$Res> {
  __$EventExtraCopyWithImpl(
      _EventExtra _value, $Res Function(_EventExtra) _then)
      : super(_value, (v) => _then(v as _EventExtra));

  @override
  _EventExtra get _value => super._value as _EventExtra;

  @override
  $Res call({
    Object? userIds = freezed,
    Object? friendsNumber = freezed,
  }) {
    return _then(_EventExtra(
      userIds: userIds == freezed
          ? _value.userIds
          : userIds // ignore: cast_nullable_to_non_nullable
              as String,
      friendsNumber: friendsNumber == freezed
          ? _value.friendsNumber
          : friendsNumber // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_EventExtra extends _EventExtra {
  _$_EventExtra({required this.userIds, required this.friendsNumber})
      : super._();

  factory _$_EventExtra.fromJson(Map<String, dynamic> json) =>
      _$_$_EventExtraFromJson(json);

  @override
  final String userIds;
  @override
  final int friendsNumber;

  @override
  String toString() {
    return 'EventExtra(userIds: $userIds, friendsNumber: $friendsNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _EventExtra &&
            (identical(other.userIds, userIds) ||
                const DeepCollectionEquality()
                    .equals(other.userIds, userIds)) &&
            (identical(other.friendsNumber, friendsNumber) ||
                const DeepCollectionEquality()
                    .equals(other.friendsNumber, friendsNumber)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(userIds) ^
      const DeepCollectionEquality().hash(friendsNumber);

  @JsonKey(ignore: true)
  @override
  _$EventExtraCopyWith<_EventExtra> get copyWith =>
      __$EventExtraCopyWithImpl<_EventExtra>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_EventExtraToJson(this);
  }
}

abstract class _EventExtra extends EventExtra {
  factory _EventExtra({required String userIds, required int friendsNumber}) =
      _$_EventExtra;
  _EventExtra._() : super._();

  factory _EventExtra.fromJson(Map<String, dynamic> json) =
      _$_EventExtra.fromJson;

  @override
  String get userIds => throw _privateConstructorUsedError;
  @override
  int get friendsNumber => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$EventExtraCopyWith<_EventExtra> get copyWith =>
      throw _privateConstructorUsedError;
}
