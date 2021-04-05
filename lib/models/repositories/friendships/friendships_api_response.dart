import 'package:event_follow/models/entities/user.dart';

class FriendshipsApiResponse {
  FriendshipsApiResponse({
    required this.friends,
  });

  factory FriendshipsApiResponse.fromJson(List<Map<String, dynamic>> json) =>
      FriendshipsApiResponse(
        friends: List<User>.from(json.map<User>((x) => User.fromJson(x))),
      );

  List<User> friends;
}
