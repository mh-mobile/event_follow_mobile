import 'package:event_follow/config/app_link_globals.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TermsTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        launch(AppLink.terms.url);
      },
      child: const ListTile(
        title: Text(
          '利用規約',
        ),
        dense: true,
      ),
    );
  }
}
