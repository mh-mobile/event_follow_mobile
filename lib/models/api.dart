enum ApiInfo {
  SESSIONS,
  USERS,
  FRIENDSHIPS,
  FOLLOWING_TWEETS,
  EVENTS,
}

extension ApiInfoExtension on ApiInfo {
  static final apiPaths = {
    ApiInfo.SESSIONS: "/api/sessions",
    ApiInfo.USERS: "/api/users",
    ApiInfo.FRIENDSHIPS: "/api/friendships",
    ApiInfo.FOLLOWING_TWEETS: "/api/following_tweets",
    ApiInfo.EVENTS: "/api/events",
  };

  String get getApiPath => apiPaths[this]!;
}

abstract class ApiRequest {
  String get getApiPath;
}

abstract class ApiClient {
  final _baseUrl;

  ApiClient({ required baseUrl }): _baseUrl = baseUrl ;
}