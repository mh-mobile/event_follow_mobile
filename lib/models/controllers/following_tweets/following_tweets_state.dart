import 'package:event_follow/models/entities/entities.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'following_tweets_state.freezed.dart';

@freezed
abstract class FollowingTweetsState with _$FollowingTweetsState {
  factory FollowingTweetsState({
    @Default(<FollowingTweet>[]) List<FollowingTweet> tweets,
    @Default(false) bool isLoading,
  }) = _FollowingTweetsState;

  FollowingTweetsState._();
}
