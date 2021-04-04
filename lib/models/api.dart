import 'dart:convert';
import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;

import '../main.dart';

final apiClientProvider = Provider((_) => ApiClient());

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
    ApiInfo.SESSIONS: '/api/sessions',
    ApiInfo.USERS: '/api/users',
    ApiInfo.FRIENDSHIPS: '/api/friendships',
    ApiInfo.FOLLOWING_TWEETS: '/api/following_tweets',
    ApiInfo.EVENTS: '/api/events',
  };

  String get apiPath => apiPaths[this]!;
}

abstract class ApiRequest {
  final getIdToken = firebaseAuth.currentUser?.getIdToken;
  String get apiPath;
  HttpMethod get httpMethod;
  String get baseDomain => env['API_DOMAIN']!;
  Uri get uri => Uri.https(baseDomain, apiPath, toParams());
  bool get isAuthenticationReauired => false;
  Map<String, String> get defaultHeaders =>
      {HttpHeaders.contentTypeHeader: 'application/json'};
  Map<String, String> toParams() => {};
  Map<String, dynamic> toJson() => {};
  Future<Map<String, String>> toHeaders() async {
    final idToken = (getIdToken != null) ? await getIdToken!() : '';
    return {
      ...defaultHeaders,
      if (isAuthenticationReauired) ...{
        HttpHeaders.authorizationHeader: 'Bearer $idToken'
      }
    };
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
          headers: await request.toHeaders(),
        );
        break;
      case HttpMethod.POST:
        response = await http.post(
          url,
          body: json.encode(request.toJson()),
          headers: await request.toHeaders(),
        );
        break;
      case HttpMethod.DELETE:
        response = await http.delete(
          url,
          headers: await request.toHeaders(),
        );
        break;
    }

    return response;
  }
}
