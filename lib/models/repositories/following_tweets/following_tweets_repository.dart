import 'dart:convert';
import 'dart:io';
import 'package:event_follow/models/entities/entities.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;

final followingTweetsRepositoryProvider = Provider.autoDispose.family<FollowingTweetsRepository, dynamic>(
        (ref, getOrGenerateIdToken) => FollowingTweetsRepository(getOrGenerateIdToken: getOrGenerateIdToken));

class FollowingTweetsRepository {
  final getOrGenerateIdToken;

  FollowingTweetsRepository({required this.getOrGenerateIdToken});

  Future<FollowingTweetsApiResults> requestFollowingTweetsApi(
      {required FollowingTweetsApiRequest request}) async {
    final url = Uri.https("event-follow-front.herokuapp.com",
        "/api/following_tweets", request.toParams());

    final response = await http.get(
      url,
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader: "Bearer ${await this.getOrGenerateIdToken()}"
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
