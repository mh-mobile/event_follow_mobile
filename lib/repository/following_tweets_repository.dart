import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class FollowingTweetsRepository {
  final jwtToken;

  FollowingTweetsRepository({required this.jwtToken});

  Future<FollowingTweetsApiResults> requestFollowingTweetsApi(
      {required FollowingTweetsApiRequest request}) async {
    final url = Uri.https("event-follow-front.herokuapp.com",
        "/api/following_tweets", request.toParams());

    final response = await http.get(
      url,
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader: "Bearer ${this.jwtToken}"
      },
    );

    return FollowingTweetsApiResults.fromJson(json.decode(response.body));
  }
}

class FollowingTweetsApiRequest {
  final String eventId;

  FollowingTweetsApiRequest({
    required this.eventId,
  });

  Map<String, String> toParams() => {
    "event_id": this.eventId,
  };
}

class FollowingTweetsApiResults {
  FollowingTweetsApiResults({
    required this.tweets,
  });

  List<FollowingTweet> tweets;

  factory FollowingTweetsApiResults.fromJson(List<dynamic> json) =>
      FollowingTweetsApiResults(
        tweets: List<FollowingTweet>.from(json.map((x) => FollowingTweet.fromJson(x))),
      );
}

class FollowingTweet {
  String id;
  String text;
  DateTime tweetedAt;
  dynamic quotedTweetId;
  dynamic retweetedTweetId;
  User user;

  FollowingTweet({
    required this.id,
    required this.text,
    required this.tweetedAt,
    this.quotedTweetId,
    this.retweetedTweetId,
    required this.user,
  });

  factory FollowingTweet.fromJson(Map<String, dynamic> json) => FollowingTweet(
    id: json["id"],
    text: json["text"],
    tweetedAt: DateTime.parse(json["tweeted_at"]),
    quotedTweetId: json["quoted_tweet_id"],
    retweetedTweetId: json["retweeted_tweet_id"],
    user: User.fromJson(json["user"]),
  );

}

class User {
  String id;
  String screenName;
  String name;
  String profileImage;
  
  User({
    required this.id,
    required this.screenName,
    required this.name,
    required this.profileImage,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    screenName: json["screen_name"],
    name: json["name"],
    profileImage: json["profile_image"],
  );

}
