import 'dart:convert';
import 'dart:io';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;
import 'friendships_api_request.dart';
import 'friendships_api_response.dart';

final friendshipsRepositoryProvider = Provider.autoDispose.family<FriendshipsRepository, dynamic>(
        (ref, getOrGenerateIdToken) => FriendshipsRepository(getOrGenerateIdToken: getOrGenerateIdToken));

class FriendshipsRepository {
  final getOrGenerateIdToken;

  FriendshipsRepository({required this.getOrGenerateIdToken});

  Future<FriendshipsApiResponse> requestFriendshipsApi(
      {required FriendshipsApiRequest request}) async {
    final url = request.uri;

    final response = await http.get(
      url,
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader: "Bearer ${await this.getOrGenerateIdToken()}"
      },
    );

    return FriendshipsApiResponse.fromJson(json.decode(response.body));
  }
}



