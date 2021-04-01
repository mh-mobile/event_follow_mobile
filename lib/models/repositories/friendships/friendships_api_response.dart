import 'package:event_follow/models/entities/user.dart';

class FriendshipsApiResponse {
  FriendshipsApiResponse({
    required this.friends,
  });

  List<User> friends;

  factory FriendshipsApiResponse.fromJson(List<dynamic> json) =>
      FriendshipsApiResponse(
        friends: List<User>.from(json.map((x) => User.fromJson(x))),
      );
}

