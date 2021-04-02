import 'dart:convert';
import 'dart:io';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../api.dart';
import 'friendships_api_request.dart';
import 'friendships_api_response.dart';

final friendshipsRepositoryProvider = Provider.autoDispose.family<FriendshipsRepository, dynamic>(
        (ref, getOrGenerateIdToken) => FriendshipsRepository(getOrGenerateIdToken: getOrGenerateIdToken, read: ref.read));

class FriendshipsRepository {
  final getOrGenerateIdToken;
  final Reader read;

  FriendshipsRepository({required this.getOrGenerateIdToken, required this.read});

  Future<FriendshipsApiResponse> requestFriendshipsApi(
      {required FriendshipsApiRequest request}) async {

    final apiClient = read(apiClientProvider);
    final response = await apiClient.request(request);

    return FriendshipsApiResponse.fromJson(json.decode(response.body));
  }
}



