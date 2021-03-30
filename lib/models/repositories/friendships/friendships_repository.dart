import 'dart:convert';
import 'dart:io';
import 'package:event_follow/models/entities/user.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;

final friendshipsRepositoryProvider = Provider.autoDispose.family<FriendshipsRepository, dynamic>(
        (ref, getOrGenerateIdToken) => FriendshipsRepository(getOrGenerateIdToken: getOrGenerateIdToken));

class FriendshipsRepository {
  final getOrGenerateIdToken;

  FriendshipsRepository({required this.getOrGenerateIdToken});

  Future<FriendshipsApiResults> requestFriendshipsApi(
      {required FriendshipsApiRequest request}) async {
    final url = Uri.https("event-follow-front.herokuapp.com",
        "/api/friendships", request.toParams());

    final response = await http.get(
      url,
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader: "Bearer ${await this.getOrGenerateIdToken()}"
      },
    );

    return FriendshipsApiResults.fromJson(json.decode(response.body));
  }
}

class FriendshipsApiRequest {
  final String userIds;

  FriendshipsApiRequest({
    required this.userIds,
  });

  Map<String, String> toParams() => {
    "user_ids": this.userIds,
  };
}

class FriendshipsApiResults {
  FriendshipsApiResults({
    required this.friends,
  });

  List<User> friends;

  factory FriendshipsApiResults.fromJson(List<dynamic> json) =>
      FriendshipsApiResults(
        friends: List<User>.from(json.map((x) => User.fromJson(x))),
      );
}

