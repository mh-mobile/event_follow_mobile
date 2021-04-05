import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../api.dart';
import 'friendships_api_request.dart';
import 'friendships_api_response.dart';

final friendshipsRepositoryProvider =
    Provider.autoDispose<FriendshipsRepository>(
        (ref) => FriendshipsRepository(read: ref.read));

class FriendshipsRepository {
  FriendshipsRepository({required this.read});
  final Reader read;

  Future<FriendshipsApiResponse> requestFriendshipsApi(
      {required FriendshipsApiRequest request}) async {
    final apiClient = read(apiClientProvider);
    final response = await apiClient.request(request);

    return FriendshipsApiResponse.fromJson(
        json.decode(response.body) as List<dynamic>);
  }
}
