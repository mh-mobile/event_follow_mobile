import 'package:event_follow/models/api.dart';

class FriendshipsApiRequest extends ApiRequest {
  final String userIds;

  FriendshipsApiRequest({
    required this.userIds,
  });

  Map<String, String> toParams() => {
        "user_ids": userIds,
      };

  @override
  bool get isAuthenticationReauired => true;

  @override
  String get apiPath => ApiInfo.FRIENDSHIPS.apiPath;

  @override
  HttpMethod get httpMethod => HttpMethod.GET;
}
