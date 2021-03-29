import 'package:event_follow/pages/events_pages/events_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:twitter_login/twitter_login.dart';

import '../../main.dart';
import 'home_page.dart';

class TwitterLoginButton extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      child: ElevatedButton.icon(
        icon: Image.asset(
          "assets/twitter_logo.png",
          height: 25,
        ),
        label: Text("Twitterでログイン"),
        onPressed: () async {
          final twitterLogin = TwitterLogin(
              apiKey: env["TWITTER_API_KEY"],
              apiSecretKey: env["TWITTER_API_SECRET_KEY"],
              redirectURI: env["TWITTER_REDIRECT_RUI"]);
          final authResult = await twitterLogin.login();
          switch (authResult.status) {
            case TwitterLoginStatus.loggedIn:
              // setState(() {
              //   isLoading = true;
              // });
              final credential = TwitterAuthProvider.credential(
                  accessToken: authResult.authToken,
                  secret: authResult.authTokenSecret);
              final firebaseCredential =
                  await firebaseAuth.signInWithCredential(credential);

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
                  return EventsPage();
                }));
              }

              break;
            case TwitterLoginStatus.cancelledByUser:
              // setState(() {
              //   isLoading = false;
              // });
              break;
            case TwitterLoginStatus.error:
              // setState(() {
              //   isLoading = false;
              // });
              break;
          }
        },
      ),
    );
  }
}
