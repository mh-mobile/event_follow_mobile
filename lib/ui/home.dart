import 'package:event_follow/main.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'package:twitter_login/twitter_login.dart';
import 'dart:convert';
import 'event_list.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Container(
        child: Column(
          children: [
            !isLoading ? FlatButton(
              child: const Text("Twitterでログイン"),
              onPressed: () async {
                final twitterLogin = TwitterLogin(
                  apiKey: "${apiKey}",
                  apiSecretKey: "${apiSecretKey}",
                  redirectURI: "${redirectURI}"
                );

                final authResult = await twitterLogin.login();
                switch (authResult.status) {
                  case TwitterLoginStatus.loggedIn:
                    setState(() {
                      isLoading = true;
                    });
                    final credential = TwitterAuthProvider.credential(
                        accessToken: authResult.authToken,
                        secret: authResult.authTokenSecret);
                    final firebaseCredential = await firebaseAuth.signInWithCredential(credential);

                    final idToken = await firebaseCredential.user?.getIdToken();

                    final request = SessionApiRequest(
                        token: idToken!,
                        accessToken: authResult.authToken,
                        accessTokenSecret: authResult.authTokenSecret);

                    final sessionApiResults =
                        await requestSessionApi(request: request);
                    if (sessionApiResults.status == "OK") {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return EventList();
                      }));
                    }

                    break;
                  case TwitterLoginStatus.cancelledByUser:
                    break;
                  case TwitterLoginStatus.error:
                    break;
                }
                setState(() {
                  isLoading = false;
                });
              },
            ) : CircularProgressIndicator(),
            RichText(
                text: TextSpan(children: [
              TextSpan(
                text: "アカウントを作成することで",
                style: TextStyle(color: Colors.grey[800]),
              ),
              TextSpan(
                  text: "利用規約",
                  style: TextStyle(color: Colors.lightBlue),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      launch("https://event-follow-front.herokuapp.com/terms");
                    }),
              TextSpan(
                text: "・",
                style: TextStyle(color: Colors.grey[800]),
              ),
              TextSpan(
                  text: "プライバシーポリシー",
                  style: TextStyle(color: Colors.lightBlue),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      launch(
                          "https://event-follow-front.herokuapp.com/privacy_policy");
                    }),
              TextSpan(
                text: "に同意したものとみなします。",
                style: TextStyle(color: Colors.grey[800]),
              ),
            ])),
          ],
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
