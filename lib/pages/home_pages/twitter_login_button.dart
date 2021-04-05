import 'package:event_follow/models/controllers/sessions_controller/sessions_controller.dart';
import 'package:event_follow/models/models.dart';
import 'package:event_follow/models/repositories/sessions/sessions_api_request.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:twitter_login/twitter_login.dart';

import '../../main.dart';

class TwitterLoginButton extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final controller = useProvider(sessionsProvider);

    return SizedBox(
      height: 44,
      child: ElevatedButton.icon(
        icon: Image.asset(
          'assets/twitter_logo.png',
          height: 25,
        ),
        label: const Text('Twitterでログイン'),
        onPressed: () async {
          final twitterLogin = TwitterLogin(
              apiKey: env['TWITTER_API_KEY']!,
              apiSecretKey: env['TWITTER_API_SECRET_KEY']!,
              redirectURI: env['TWITTER_REDIRECT_RUI']!);
          final authResult = await twitterLogin.login();
          switch (authResult.status!) {
            case TwitterLoginStatus.loggedIn:
              controller.setLoading(isLoading: true);
              final credential = TwitterAuthProvider.credential(
                  accessToken: authResult.authToken!,
                  secret: authResult.authTokenSecret!);
              final firebaseCredential =
                  await firebaseAuth.signInWithCredential(credential);

              final idToken = await firebaseCredential.user?.getIdToken();

              final request = SessionsApiRequest(
                  token: idToken!,
                  accessToken: authResult.authToken!,
                  accessTokenSecret: authResult.authTokenSecret!);
              await controller.request(request);
              break;
            case TwitterLoginStatus.cancelledByUser:
              controller.setLoading(isLoading: false);
              break;
            case TwitterLoginStatus.error:
              controller.setLoading(isLoading: false);
              break;
          }
        },
      ),
    );
  }
}
