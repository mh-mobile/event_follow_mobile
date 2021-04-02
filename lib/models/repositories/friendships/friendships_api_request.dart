import 'package:event_follow/models/api.dart';

class FriendshipsApiRequest extends ApiRequest {
  final String userIds;

  FriendshipsApiRequest({
    required this.userIds,
  });

  Map<String, String> toParams() => {
        "user_ids": this.userIds,
      };

  @override
  String get getApiPath => ApiInfo.FRIENDSHIPS.getApiPath;
}
