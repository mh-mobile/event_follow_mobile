import 'package:event_follow/models/entities/user.dart';

class FriendshipsApiResponse {
  FriendshipsApiResponse({
    required this.friends,
  });

  factory FriendshipsApiResponse.fromJson(List<dynamic> json) =>
      FriendshipsApiResponse(
        friends: List<User>.from(json.map<User>(
            (dynamic x) => User.fromJson(x as Map<String, dynamic>))),
      );

  List<User> friends;
}
