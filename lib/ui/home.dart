import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'event_list.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home"),),
      body: Container(
        child: Column(
          children: [
            RaisedButton(
              child: const Text("ログイン"),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return EventList();
                  })
                );
              },
            ),
            RichText(
                text: TextSpan(
                  children: [
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
                        }
                    ),
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
                        }
                    ),
                    TextSpan(
                      text: "に同意したものとみなします。",
                      style: TextStyle(color: Colors.grey[800]),
                    ),
                  ]
                )
            ),
          ],

        ),
      ),
    );
  }
}
