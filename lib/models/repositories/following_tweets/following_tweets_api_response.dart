import 'package:event_follow/models/entities/following_tweet.dart';

class FollowingTweetsApiResponse {
  FollowingTweetsApiResponse({
    required this.tweets,
  });

  factory FollowingTweetsApiResponse.fromJson(List<dynamic> json) =>
      FollowingTweetsApiResponse(
        tweets: List<FollowingTweet>.from(json.map<FollowingTweet>(
            (dynamic x) => FollowingTweet.fromJson(x as Map<String, dynamic>))),
      );

  List<FollowingTweet> tweets;
}
