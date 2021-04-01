import 'dart:convert';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;
import 'sessions_api_request.dart';
import 'sessions_api_response.dart';

final sessionsRepositoryProvider = Provider.autoDispose(
        (ref) => SessionsRepository());

class SessionsRepository {

  SessionsRepository();

  Future<SessionsApiResponse> requestSessionsApi(
      {required SessionsApiRequest request}) async {
    final url =
    Uri.parse("https://event-follow-front.herokuapp.com/api/sessions");
    final response = await http.post(
      url,
      body: json.encode(request.toJson()),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      return SessionsApiResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception("Login Failed");
    }
  }
}


