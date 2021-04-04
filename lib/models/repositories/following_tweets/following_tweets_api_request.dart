import 'package:event_follow/models/api.dart';

class FollowingTweetsApiRequest extends ApiRequest {
  final String eventId;

  FollowingTweetsApiRequest({
    required this.eventId,
  });

  Map<String, String> toParams() => {
        'event_id': eventId,
      };

  @override
  bool get isAuthenticationReauired => true;

  @override
  String get apiPath => ApiInfo.FOLLOWING_TWEETS.apiPath;

  @override
  HttpMethod get httpMethod => HttpMethod.GET;
}
