import 'package:event_follow/config/app_link_globals.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PrivacyPolicyTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        launch(AppLink.PrivacyPolicy.url);
      },
      child: ListTile(
        title: Text(
          'プライバシーポリシー',
        ),
        dense: true,
      ),
    );
  }
}
