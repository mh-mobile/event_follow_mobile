// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'following_tweet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FollowingTweet _$_$_FollowingTweetFromJson(Map<String, dynamic> json) {
  return _$_FollowingTweet(
    id: json['id'] as String,
    text: json['text'] as String,
    tweetedAt: DateTime.parse(json['tweetedAt'] as String),
    quotedTweetId: json['quotedTweetId'],
    retweetedTweetId: json['retweetedTweetId'],
    user: User.fromJson(json['user'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_FollowingTweetToJson(_$_FollowingTweet instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'tweetedAt': instance.tweetedAt.toIso8601String(),
      'quotedTweetId': instance.quotedTweetId,
      'retweetedTweetId': instance.retweetedTweetId,
      'user': instance.user,
    };
