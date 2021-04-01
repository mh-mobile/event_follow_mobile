import 'dart:convert';
import 'dart:io';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;
import 'following_tweets_api_request.dart';
import 'following_tweets_api_response.dart';

final followingTweetsRepositoryProvider = Provider.autoDispose.family<FollowingTweetsRepository, dynamic>(
        (ref, getOrGenerateIdToken) => FollowingTweetsRepository(getOrGenerateIdToken: getOrGenerateIdToken));

class FollowingTweetsRepository {
  final getOrGenerateIdToken;

  FollowingTweetsRepository({required this.getOrGenerateIdToken});

  Future<FollowingTweetsApiResponse> requestFollowingTweetsApi(
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

    return FollowingTweetsApiResponse.fromJson(json.decode(response.body));
  }
}
