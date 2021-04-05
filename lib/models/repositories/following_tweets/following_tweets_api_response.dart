import 'package:event_follow/models/entities/following_tweet.dart';

class FollowingTweetsApiResponse {
  FollowingTweetsApiResponse({
    required this.tweets,
  });

  factory FollowingTweetsApiResponse.fromJson(
          List<Map<String, dynamic>> json) =>
      FollowingTweetsApiResponse(
        tweets: List<FollowingTweet>.from(
            json.map<FollowingTweet>((x) => FollowingTweet.fromJson(x))),
      );

  List<FollowingTweet> tweets;
}
