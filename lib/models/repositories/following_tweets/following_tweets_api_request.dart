import 'package:event_follow/models/api.dart';

class FollowingTweetsApiRequest extends ApiRequest {
  final String eventId;

  FollowingTweetsApiRequest({
    required this.eventId,
  });

  Map<String, String> toParams() => {
    "event_id": this.eventId,
  };

  @override
  String get getApiPath => ApiInfo.FOLLOWING_TWEETS.getApiPath;
}
