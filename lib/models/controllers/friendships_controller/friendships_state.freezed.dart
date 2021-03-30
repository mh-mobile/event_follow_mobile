// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'friendships_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$FriendshipsStateTearOff {
  const _$FriendshipsStateTearOff();

  _FriendshipsState call(
      {Map<int, List<User>> friendsData = const <int, List<User>>{},
      Map<int, bool> loadingData = const <int, bool>{}}) {
    return _FriendshipsState(
      friendsData: friendsData,
      loadingData: loadingData,
    );
  }
}

/// @nodoc
const $FriendshipsState = _$FriendshipsStateTearOff();

/// @nodoc
mixin _$FriendshipsState {
  Map<int, List<User>> get friendsData => throw _privateConstructorUsedError;
  Map<int, bool> get loadingData => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FriendshipsStateCopyWith<FriendshipsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FriendshipsStateCopyWith<$Res> {
  factory $FriendshipsStateCopyWith(
          FriendshipsState value, $Res Function(FriendshipsState) then) =
      _$FriendshipsStateCopyWithImpl<$Res>;
  $Res call({Map<int, List<User>> friendsData, Map<int, bool> loadingData});
}

/// @nodoc
class _$FriendshipsStateCopyWithImpl<$Res>
    implements $FriendshipsStateCopyWith<$Res> {
  _$FriendshipsStateCopyWithImpl(this._value, this._then);

  final FriendshipsState _value;
  // ignore: unused_field
  final $Res Function(FriendshipsState) _then;

  @override
  $Res call({
    Object? friendsData = freezed,
    Object? loadingData = freezed,
  }) {
    return _then(_value.copyWith(
      friendsData: friendsData == freezed
          ? _value.friendsData
          : friendsData // ignore: cast_nullable_to_non_nullable
              as Map<int, List<User>>,
      loadingData: loadingData == freezed
          ? _value.loadingData
          : loadingData // ignore: cast_nullable_to_non_nullable
              as Map<int, bool>,
    ));
  }
}

/// @nodoc
abstract class _$FriendshipsStateCopyWith<$Res>
    implements $FriendshipsStateCopyWith<$Res> {
  factory _$FriendshipsStateCopyWith(
          _FriendshipsState value, $Res Function(_FriendshipsState) then) =
      __$FriendshipsStateCopyWithImpl<$Res>;
  @override
  $Res call({Map<int, List<User>> friendsData, Map<int, bool> loadingData});
}

/// @nodoc
class __$FriendshipsStateCopyWithImpl<$Res>
    extends _$FriendshipsStateCopyWithImpl<$Res>
    implements _$FriendshipsStateCopyWith<$Res> {
  __$FriendshipsStateCopyWithImpl(
      _FriendshipsState _value, $Res Function(_FriendshipsState) _then)
      : super(_value, (v) => _then(v as _FriendshipsState));

  @override
  _FriendshipsState get _value => super._value as _FriendshipsState;

  @override
  $Res call({
    Object? friendsData = freezed,
    Object? loadingData = freezed,
  }) {
    return _then(_FriendshipsState(
      friendsData: friendsData == freezed
          ? _value.friendsData
          : friendsData // ignore: cast_nullable_to_non_nullable
              as Map<int, List<User>>,
      loadingData: loadingData == freezed
          ? _value.loadingData
          : loadingData // ignore: cast_nullable_to_non_nullable
              as Map<int, bool>,
    ));
  }
}

/// @nodoc
class _$_FriendshipsState extends _FriendshipsState {
  _$_FriendshipsState(
      {this.friendsData = const <int, List<User>>{},
      this.loadingData = const <int, bool>{}})
      : super._();

  @JsonKey(defaultValue: const <int, List<User>>{})
  @override
  final Map<int, List<User>> friendsData;
  @JsonKey(defaultValue: const <int, bool>{})
  @override
  final Map<int, bool> loadingData;

  @override
  String toString() {
    return 'FriendshipsState(friendsData: $friendsData, loadingData: $loadingData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FriendshipsState &&
            (identical(other.friendsData, friendsData) ||
                const DeepCollectionEquality()
                    .equals(other.friendsData, friendsData)) &&
            (identical(other.loadingData, loadingData) ||
                const DeepCollectionEquality()
                    .equals(other.loadingData, loadingData)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(friendsData) ^
      const DeepCollectionEquality().hash(loadingData);

  @JsonKey(ignore: true)
  @override
  _$FriendshipsStateCopyWith<_FriendshipsState> get copyWith =>
      __$FriendshipsStateCopyWithImpl<_FriendshipsState>(this, _$identity);
}

abstract class _FriendshipsState extends FriendshipsState {
  factory _FriendshipsState(
      {Map<int, List<User>> friendsData,
      Map<int, bool> loadingData}) = _$_FriendshipsState;
  _FriendshipsState._() : super._();

  @override
  Map<int, List<User>> get friendsData => throw _privateConstructorUsedError;
  @override
  Map<int, bool> get loadingData => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$FriendshipsStateCopyWith<_FriendshipsState> get copyWith =>
      throw _privateConstructorUsedError;
}
