import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../api.dart';
import 'following_tweets_api_request.dart';
import 'following_tweets_api_response.dart';

final followingTweetsRepositoryProvider =
    Provider.autoDispose<FollowingTweetsRepository>(
        (ref) => FollowingTweetsRepository(read: ref.read));

class FollowingTweetsRepository {
  FollowingTweetsRepository({required this.read});

  final Reader read;

  Future<FollowingTweetsApiResponse> requestFollowingTweetsApi(
      {required FollowingTweetsApiRequest request}) async {
    final apiClient = read(apiClientProvider);
    final response = await apiClient.request(request);
    return FollowingTweetsApiResponse.fromJson(
        json.decode(response.body) as List<Map<String, dynamic>>);
  }
}
