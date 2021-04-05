import 'package:event_follow/models/api.dart';

class SessionsApiRequest extends ApiRequest {
  SessionsApiRequest({
    required this.token,
    required this.accessToken,
    required this.accessTokenSecret,
  });

  final String token;
  final String accessToken;
  final String accessTokenSecret;

  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'token': token,
        'access_token': accessToken,
        'access_token_secret': accessTokenSecret,
      };

  @override
  String get apiPath => ApiInfo.sessions.apiPath;

  @override
  HttpMethod get httpMethod => HttpMethod.post;
}
