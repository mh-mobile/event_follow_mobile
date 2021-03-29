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
              launch("https://event-follow-front.herokuapp.com/privacy_policy");
            }),
      TextSpan(
        text: "に同意したものとみなします。",
        style: TextStyle(color: Colors.grey[800]),
      ),
    ]));
  }
}
