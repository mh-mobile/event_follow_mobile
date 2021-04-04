import 'dart:convert';
import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;

import '../main.dart';

final apiClientProvider = Provider((_) => ApiClient());

enum ApiInfo {
  sessions,
  users,
  friendships,
  followingTweets,
  events,
}

enum HttpMethod {
  get,
  post,
  delete,
}

extension ApiInfoExtension on ApiInfo {
  static final apiPaths = {
    ApiInfo.sessions: '/api/sessions',
    ApiInfo.users: '/api/users',
    ApiInfo.friendships: '/api/friendships',
    ApiInfo.followingTweets: '/api/following_tweets',
    ApiInfo.events: '/api/events',
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

  @override
  Future<http.Response> request(ApiRequest request) async {
    final url = request.uri;
    final http.Response response;

    switch (request.httpMethod) {
      case HttpMethod.get:
        response = await http.get(
          url,
          headers: await request.toHeaders(),
        );
        break;
      case HttpMethod.post:
        response = await http.post(
          url,
          body: json.encode(request.toJson()),
          headers: await request.toHeaders(),
        );
        break;
      case HttpMethod.delete:
        response = await http.delete(
          url,
          headers: await request.toHeaders(),
        );
        break;
    }

    return response;
  }
}
