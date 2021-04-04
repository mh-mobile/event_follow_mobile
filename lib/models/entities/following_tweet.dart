import 'package:event_follow/models/entities/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'following_tweet.freezed.dart';
part 'following_tweet.g.dart';

@freezed
abstract class FollowingTweet implements _$FollowingTweet {
  factory FollowingTweet({
    required String id,
    required String text,
    required DateTime tweetedAt,
    required dynamic quotedTweetId,
    required dynamic retweetedTweetId,
    required User user,
  }) = _FollowingTweet;

  FollowingTweet._();

  factory FollowingTweet.fromJson(Map<String, dynamic> json) => FollowingTweet(
        id: json['id'],
        text: json['text'],
        tweetedAt: DateTime.parse(json['tweeted_at']),
        quotedTweetId: json['quoted_tweet_id'],
        retweetedTweetId: json['retweeted_tweet_id'],
        user: User.fromJson(json['user']),
      );
}
