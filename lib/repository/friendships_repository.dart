import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class FriendshipsRepository {
  final jwtToken;

  FriendshipsRepository({required this.jwtToken});

  Future<FriendshipsApiResults> requestFriendshipsApi(
      {required FriendshipsApiRequest request}) async {
    final url = Uri.https("event-follow-front.herokuapp.com",
        "/api/friendships", request.toParams());

    final response = await http.get(
      url,
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader: "Bearer ${this.jwtToken}"
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

  List<Friend> friends;

  factory FriendshipsApiResults.fromJson(List<dynamic> json) =>
      FriendshipsApiResults(
        friends: List<Friend>.from(json.map((x) => Friend.fromJson(x))),
      );
}

class Friend {
  Friend({
    required this.id,
    required this.screenName,
    required this.name,
    required this.profileImage,
  });

  String id;
  String screenName;
  String name;
  String profileImage;

  factory Friend.fromJson(Map<String, dynamic> json) => Friend(
    id: json["id"],
    screenName: json["screen_name"],
    name: json["name"],
    profileImage: json["profile_image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "screen_name": screenName,
    "name": name,
    "profile_image": profileImage,
  };
}
