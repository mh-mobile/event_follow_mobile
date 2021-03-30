import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PrivacyPolicyTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        launch("https://event-follow-front.herokuapp.com/privacy_policy");
      },
      child: ListTile(
        title: Text("プライバシーポリシー", ),
        dense: true,
      ),
    );
  }
}