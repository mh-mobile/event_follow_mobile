// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'following_tweets_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$FollowingTweetsStateTearOff {
  const _$FollowingTweetsStateTearOff();

  _FollowingTweetsState call(
      {List<FollowingTweet> tweets = const <FollowingTweet>[],
      bool isLoading = false}) {
    return _FollowingTweetsState(
      tweets: tweets,
      isLoading: isLoading,
    );
  }
}

/// @nodoc
const $FollowingTweetsState = _$FollowingTweetsStateTearOff();

/// @nodoc
mixin _$FollowingTweetsState {
  List<FollowingTweet> get tweets => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FollowingTweetsStateCopyWith<FollowingTweetsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FollowingTweetsStateCopyWith<$Res> {
  factory $FollowingTweetsStateCopyWith(FollowingTweetsState value,
          $Res Function(FollowingTweetsState) then) =
      _$FollowingTweetsStateCopyWithImpl<$Res>;
  $Res call({List<FollowingTweet> tweets, bool isLoading});
}

/// @nodoc
class _$FollowingTweetsStateCopyWithImpl<$Res>
    implements $FollowingTweetsStateCopyWith<$Res> {
  _$FollowingTweetsStateCopyWithImpl(this._value, this._then);

  final FollowingTweetsState _value;
  // ignore: unused_field
  final $Res Function(FollowingTweetsState) _then;

  @override
  $Res call({
    Object? tweets = freezed,
    Object? isLoading = freezed,
  }) {
    return _then(_value.copyWith(
      tweets: tweets == freezed
          ? _value.tweets
          : tweets // ignore: cast_nullable_to_non_nullable
              as List<FollowingTweet>,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$FollowingTweetsStateCopyWith<$Res>
    implements $FollowingTweetsStateCopyWith<$Res> {
  factory _$FollowingTweetsStateCopyWith(_FollowingTweetsState value,
          $Res Function(_FollowingTweetsState) then) =
      __$FollowingTweetsStateCopyWithImpl<$Res>;
  @override
  $Res call({List<FollowingTweet> tweets, bool isLoading});
}

/// @nodoc
class __$FollowingTweetsStateCopyWithImpl<$Res>
    extends _$FollowingTweetsStateCopyWithImpl<$Res>
    implements _$FollowingTweetsStateCopyWith<$Res> {
  __$FollowingTweetsStateCopyWithImpl(
      _FollowingTweetsState _value, $Res Function(_FollowingTweetsState) _then)
      : super(_value, (v) => _then(v as _FollowingTweetsState));

  @override
  _FollowingTweetsState get _value => super._value as _FollowingTweetsState;

  @override
  $Res call({
    Object? tweets = freezed,
    Object? isLoading = freezed,
  }) {
    return _then(_FollowingTweetsState(
      tweets: tweets == freezed
          ? _value.tweets
          : tweets // ignore: cast_nullable_to_non_nullable
              as List<FollowingTweet>,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
class _$_FollowingTweetsState extends _FollowingTweetsState {
  _$_FollowingTweetsState(
      {this.tweets = const <FollowingTweet>[], this.isLoading = false})
      : super._();

  @JsonKey(defaultValue: const <FollowingTweet>[])
  @override
  final List<FollowingTweet> tweets;
  @JsonKey(defaultValue: false)
  @override
  final bool isLoading;

  @override
  String toString() {
    return 'FollowingTweetsState(tweets: $tweets, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FollowingTweetsState &&
            (identical(other.tweets, tweets) ||
                const DeepCollectionEquality().equals(other.tweets, tweets)) &&
            (identical(other.isLoading, isLoading) ||
                const DeepCollectionEquality()
                    .equals(other.isLoading, isLoading)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(tweets) ^
      const DeepCollectionEquality().hash(isLoading);

  @JsonKey(ignore: true)
  @override
  _$FollowingTweetsStateCopyWith<_FollowingTweetsState> get copyWith =>
      __$FollowingTweetsStateCopyWithImpl<_FollowingTweetsState>(
          this, _$identity);
}

abstract class _FollowingTweetsState extends FollowingTweetsState {
  factory _FollowingTweetsState({List<FollowingTweet> tweets, bool isLoading}) =
      _$_FollowingTweetsState;
  _FollowingTweetsState._() : super._();

  @override
  List<FollowingTweet> get tweets => throw _privateConstructorUsedError;
  @override
  bool get isLoading => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$FollowingTweetsStateCopyWith<_FollowingTweetsState> get copyWith =>
      throw _privateConstructorUsedError;
}
