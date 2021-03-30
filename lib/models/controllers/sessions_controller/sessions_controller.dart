import 'package:event_follow/models/controllers/sessions_controller/sessions_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

final sessionsProvider = StateNotifierProvider.autoDispose((ref) => SessionsController(ref.read));

class SessionsController extends StateNotifier<SessionsState> {
  SessionsController(this._read): super(SessionsState()) {
    state = state.copyWith(
      status: SessionsStatus.NG,
      isLoading: false,
    );
  }

  final Reader _read;

  Future<void> request(SessionApiRequest request) async {

    final sessionApiResults =
    await _requestSessionApi(request: request);
    state = state.copyWith(
      status: sessionApiResults.status == "OK" ? SessionsStatus.OK : SessionsStatus.NG,
    );
  }

  void setLoading(bool isLoading) {
    state = state.copyWith(
      isLoading: isLoading
    );
  }

  Future<SessionApiResults> _requestSessionApi(
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
