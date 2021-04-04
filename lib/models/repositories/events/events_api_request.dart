import 'package:event_follow/models/api.dart';

class EventsApiRequest extends ApiRequest {
  EventsApiRequest({
    required this.pageId,
    this.sort,
    this.time,
    this.friends,
  });

  final String pageId;
  final String? sort;
  final String? time;
  final String? friends;

  @override
  Map<String, String> toParams() => {
        'page': pageId,
        if (sort != null) 'sort': sort!,
        if (time != null) 'time': time!,
        if (friends != null) 'friends': friends!,
      };

  @override
  bool get isAuthenticationReauired => true;

  @override
  String get apiPath => ApiInfo.EVENTS.apiPath;

  @override
  HttpMethod get httpMethod => HttpMethod.get;
}
