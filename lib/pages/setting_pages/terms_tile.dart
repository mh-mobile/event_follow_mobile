import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TermsTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        launch("https://event-follow-front.herokuapp.com/terms");
      },
      child: ListTile(
        title: Text("利用規約", ),
        dense: true,
      ),
    );
  }
}