// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'following_tweet.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FollowingTweet _$FollowingTweetFromJson(Map<String, dynamic> json) {
  return _FollowingTweet.fromJson(json);
}

/// @nodoc
class _$FollowingTweetTearOff {
  const _$FollowingTweetTearOff();

  _FollowingTweet call(
      {required String id,
      required String text,
      required DateTime tweetedAt,
      required dynamic quotedTweetId,
      required dynamic retweetedTweetId,
      required User user}) {
    return _FollowingTweet(
      id: id,
      text: text,
      tweetedAt: tweetedAt,
      quotedTweetId: quotedTweetId,
      retweetedTweetId: retweetedTweetId,
      user: user,
    );
  }

  FollowingTweet fromJson(Map<String, Object> json) {
    return FollowingTweet.fromJson(json);
  }
}

/// @nodoc
const $FollowingTweet = _$FollowingTweetTearOff();

/// @nodoc
mixin _$FollowingTweet {
  String get id => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  DateTime get tweetedAt => throw _privateConstructorUsedError;
  dynamic get quotedTweetId => throw _privateConstructorUsedError;
  dynamic get retweetedTweetId => throw _privateConstructorUsedError;
  User get user => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FollowingTweetCopyWith<FollowingTweet> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FollowingTweetCopyWith<$Res> {
  factory $FollowingTweetCopyWith(
          FollowingTweet value, $Res Function(FollowingTweet) then) =
      _$FollowingTweetCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String text,
      DateTime tweetedAt,
      dynamic quotedTweetId,
      dynamic retweetedTweetId,
      User user});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class _$FollowingTweetCopyWithImpl<$Res>
    implements $FollowingTweetCopyWith<$Res> {
  _$FollowingTweetCopyWithImpl(this._value, this._then);

  final FollowingTweet _value;
  // ignore: unused_field
  final $Res Function(FollowingTweet) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? text = freezed,
    Object? tweetedAt = freezed,
    Object? quotedTweetId = freezed,
    Object? retweetedTweetId = freezed,
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      tweetedAt: tweetedAt == freezed
          ? _value.tweetedAt
          : tweetedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      quotedTweetId: quotedTweetId == freezed
          ? _value.quotedTweetId
          : quotedTweetId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      retweetedTweetId: retweetedTweetId == freezed
          ? _value.retweetedTweetId
          : retweetedTweetId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }

  @override
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc
abstract class _$FollowingTweetCopyWith<$Res>
    implements $FollowingTweetCopyWith<$Res> {
  factory _$FollowingTweetCopyWith(
          _FollowingTweet value, $Res Function(_FollowingTweet) then) =
      __$FollowingTweetCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String text,
      DateTime tweetedAt,
      dynamic quotedTweetId,
      dynamic retweetedTweetId,
      User user});

  @override
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$FollowingTweetCopyWithImpl<$Res>
    extends _$FollowingTweetCopyWithImpl<$Res>
    implements _$FollowingTweetCopyWith<$Res> {
  __$FollowingTweetCopyWithImpl(
      _FollowingTweet _value, $Res Function(_FollowingTweet) _then)
      : super(_value, (v) => _then(v as _FollowingTweet));

  @override
  _FollowingTweet get _value => super._value as _FollowingTweet;

  @override
  $Res call({
    Object? id = freezed,
    Object? text = freezed,
    Object? tweetedAt = freezed,
    Object? quotedTweetId = freezed,
    Object? retweetedTweetId = freezed,
    Object? user = freezed,
  }) {
    return _then(_FollowingTweet(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      tweetedAt: tweetedAt == freezed
          ? _value.tweetedAt
          : tweetedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      quotedTweetId: quotedTweetId == freezed
          ? _value.quotedTweetId
          : quotedTweetId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      retweetedTweetId: retweetedTweetId == freezed
          ? _value.retweetedTweetId
          : retweetedTweetId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_FollowingTweet extends _FollowingTweet {
  _$_FollowingTweet(
      {required this.id,
      required this.text,
      required this.tweetedAt,
      required this.quotedTweetId,
      required this.retweetedTweetId,
      required this.user})
      : super._();

  factory _$_FollowingTweet.fromJson(Map<String, dynamic> json) =>
      _$_$_FollowingTweetFromJson(json);

  @override
  final String id;
  @override
  final String text;
  @override
  final DateTime tweetedAt;
  @override
  final dynamic quotedTweetId;
  @override
  final dynamic retweetedTweetId;
  @override
  final User user;

  @override
  String toString() {
    return 'FollowingTweet(id: $id, text: $text, tweetedAt: $tweetedAt, quotedTweetId: $quotedTweetId, retweetedTweetId: $retweetedTweetId, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FollowingTweet &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.text, text) ||
                const DeepCollectionEquality().equals(other.text, text)) &&
            (identical(other.tweetedAt, tweetedAt) ||
                const DeepCollectionEquality()
                    .equals(other.tweetedAt, tweetedAt)) &&
            (identical(other.quotedTweetId, quotedTweetId) ||
                const DeepCollectionEquality()
                    .equals(other.quotedTweetId, quotedTweetId)) &&
            (identical(other.retweetedTweetId, retweetedTweetId) ||
                const DeepCollectionEquality()
                    .equals(other.retweetedTweetId, retweetedTweetId)) &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(text) ^
      const DeepCollectionEquality().hash(tweetedAt) ^
      const DeepCollectionEquality().hash(quotedTweetId) ^
      const DeepCollectionEquality().hash(retweetedTweetId) ^
      const DeepCollectionEquality().hash(user);

  @JsonKey(ignore: true)
  @override
  _$FollowingTweetCopyWith<_FollowingTweet> get copyWith =>
      __$FollowingTweetCopyWithImpl<_FollowingTweet>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_FollowingTweetToJson(this);
  }
}

abstract class _FollowingTweet extends FollowingTweet {
  factory _FollowingTweet(
      {required String id,
      required String text,
      required DateTime tweetedAt,
      required dynamic quotedTweetId,
      required dynamic retweetedTweetId,
      required User user}) = _$_FollowingTweet;
  _FollowingTweet._() : super._();

  factory _FollowingTweet.fromJson(Map<String, dynamic> json) =
      _$_FollowingTweet.fromJson;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  String get text => throw _privateConstructorUsedError;
  @override
  DateTime get tweetedAt => throw _privateConstructorUsedError;
  @override
  dynamic get quotedTweetId => throw _privateConstructorUsedError;
  @override
  dynamic get retweetedTweetId => throw _privateConstructorUsedError;
  @override
  User get user => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$FollowingTweetCopyWith<_FollowingTweet> get copyWith =>
      throw _privateConstructorUsedError;
}
