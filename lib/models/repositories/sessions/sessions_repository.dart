import 'dart:convert';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;

final sessionsRepositoryProvider = Provider.autoDispose(
        (ref) => SessionsRepository());

class SessionsRepository {

  SessionsRepository();

  Future<SessionApiResults> requestSessionsApi(
      {required SessionApiRequest request}) async {
    final url =
    Uri.parse("https://event-follow-front.herokuapp.com/api/sessions");
    final response = await http.post(
      url,
      body: json.encode(request.toJson()),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      return SessionApiResults.fromJson(json.decode(response.body));
    } else {
      throw Exception("Login Failed");
    }
  }
}

class SessionApiRequest {
  final String token;
  final String accessToken;
  final String accessTokenSecret;

  SessionApiRequest({
    required this.token,
    required this.accessToken,
    required this.accessTokenSecret,
  });

  Map<String, dynamic> toJson() => {
    "token": this.token,
    "access_token": this.accessToken,
    "access_token_secret": this.accessTokenSecret,
  };
}

class SessionApiResults {
  final String status;
  final String? message;

  SessionApiResults({
    required this.status,
    this.message,
  });

  factory SessionApiResults.fromJson(Map<String, dynamic> json) {
    return SessionApiResults(status: json["status"], message: json["message"]);
  }
}
