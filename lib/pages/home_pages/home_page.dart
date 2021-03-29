import 'package:event_follow/pages/home_pages/home_footer.dart';
import 'package:event_follow/pages/home_pages/twitter_login_button.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'home_logo.dart';

bool isLoading = false;

class HomePage extends HookWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0.0),
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 6/7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    flex: 1,
                    child: Container()
                ),
                HomeLogo(),
                Expanded(
                    flex: 2,
                    child: Container()
                ),
                !isLoading ? TwitterLoginButton() : Container(
                    height: 44,
                    width: 44,
                    child: CircularProgressIndicator()
                ),
                Expanded(
                    flex: 3,
                    child: Container()
                ),
                HomeFooter(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


Future<SessionApiResults> requestSessionApi(
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
