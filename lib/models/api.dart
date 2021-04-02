import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

enum ApiInfo {
  SESSIONS,
  USERS,
  FRIENDSHIPS,
  FOLLOWING_TWEETS,
  EVENTS,
}

enum HttpMethod {
  GET,
  POST,
  DELETE,
}

extension ApiInfoExtension on ApiInfo {
  static final apiPaths = {
    ApiInfo.SESSIONS: "/api/sessions",
    ApiInfo.USERS: "/api/users",
    ApiInfo.FRIENDSHIPS: "/api/friendships",
    ApiInfo.FOLLOWING_TWEETS: "/api/following_tweets",
    ApiInfo.EVENTS: "/api/events",
  };

  String get apiPath => apiPaths[this]!;
}

abstract class ApiRequest {
  Map<String, String> _additionalHeaders = {} ;

  String get apiPath;
  HttpMethod get httpMethod;
  String get baseDomain => "event-follow-front.herokuapp.com";
  Uri get uri => Uri.https(baseDomain, apiPath, toParams());
  Map<String, String> get defaultHeaders => { HttpHeaders.authorizationHeader: "application/json" };
  Map<String, String> toParams() => {};
  Map<String, dynamic> toJson() => {};
  void appendHeader(Map<String, String> appendedHeaders) {
    _additionalHeaders = appendedHeaders;
  }
  Map<String, String> toHeaders() {
    return {...defaultHeaders, ..._additionalHeaders};
  }
}

abstract class ApiBaseClient {
  Future<http.Response> request(ApiRequest request);
}

class ApiClient extends ApiBaseClient {
  ApiClient() : super();

  Future<http.Response> request(ApiRequest request) async {
    final url = request.uri;

    final response;

    switch (request.httpMethod) {
      case HttpMethod.GET:
        response = await http.get(
          url,
          headers: request.toHeaders(),
        );
        break;
      case HttpMethod.POST:
        response = await http.post(
          url,
          body: json.encode(request.toJson()),
          headers: request.toHeaders(),
        );
        break;
      case HttpMethod.DELETE:
        response = await http.delete(
          url,
          headers: request.toHeaders(),
        );
        break;
    }

    return response;
  }

}
