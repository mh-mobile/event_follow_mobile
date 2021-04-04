import 'package:event_follow/models/api.dart';

class SessionsApiRequest extends ApiRequest {
  final String token;
  final String accessToken;
  final String accessTokenSecret;

  SessionsApiRequest({
    required this.token,
    required this.accessToken,
    required this.accessTokenSecret,
  });

  @override
  Map<String, dynamic> toJson() => {
        'token': token,
        'access_token': accessToken,
        'access_token_secret': accessTokenSecret,
      };

  @override
  String get apiPath => ApiInfo.SESSIONS.apiPath;

  @override
  HttpMethod get httpMethod => HttpMethod.POST;
}
