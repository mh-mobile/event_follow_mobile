import 'package:event_follow/config/app_link_globals.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeFooter extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(children: [
      TextSpan(
        text: 'アカウントを作成することで',
        style: TextStyle(color: Colors.grey[800]),
      ),
      TextSpan(
          text: '利用規約',
          style: const TextStyle(color: Colors.lightBlue),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              launch(AppLink.terms.url);
            }),
      TextSpan(
        text: '・',
        style: TextStyle(color: Colors.grey[800]),
      ),
      TextSpan(
          text: 'プライバシーポリシー',
          style: const TextStyle(color: Colors.lightBlue),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              launch(AppLink.privacyPolicy.url);
            }),
      TextSpan(
        text: 'に同意したものとみなします。',
        style: TextStyle(color: Colors.grey[800]),
      ),
    ]));
  }
}
