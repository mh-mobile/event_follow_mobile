import 'dart:convert';
import 'dart:io';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../api.dart';
import 'following_tweets_api_request.dart';
import 'following_tweets_api_response.dart';

final followingTweetsRepositoryProvider = Provider.autoDispose.family<FollowingTweetsRepository, dynamic>(
        (ref, getOrGenerateIdToken) => FollowingTweetsRepository(getOrGenerateIdToken: getOrGenerateIdToken, read: ref.read));

class FollowingTweetsRepository {
  final getOrGenerateIdToken;
  final Reader read;

  FollowingTweetsRepository({required this.getOrGenerateIdToken, required this.read});

  Future<FollowingTweetsApiResponse> requestFollowingTweetsApi(
      {required FollowingTweetsApiRequest request}) async {

    final apiClient = read(apiClientProvider);
    final response = await apiClient.request(request);
    return FollowingTweetsApiResponse.fromJson(json.decode(response.body));
  }
}
