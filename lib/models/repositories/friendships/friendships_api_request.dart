import 'package:event_follow/models/api.dart';

class FriendshipsApiRequest extends ApiRequest {
  FriendshipsApiRequest({
    required this.userIds,
  });

  final String userIds;

  @override
  Map<String, String> toParams() => {
        'user_ids': userIds,
      };

  @override
  bool get isAuthenticationReauired => true;

  @override
  String get apiPath => ApiInfo.friendships.apiPath;

  @override
  HttpMethod get httpMethod => HttpMethod.get;
}
