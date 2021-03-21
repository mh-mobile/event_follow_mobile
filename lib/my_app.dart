import 'package:event_follow/main.dart';
import 'package:event_follow/ui/event_list.dart';
import 'package:event_follow/ui/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  Future<String> get jwtToken async {
    final jwtToken = await storage.read(key: "jwt_token");
    if (jwtToken == null) return "";
    return jwtToken;
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder(
        future: jwtToken,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }

          if (snapshot.data != "") {
            final data = snapshot.data! as String;
            final jwt = data.split(".");
            if (jwt.length != 3) {
              return Home();
            }

            return EventList();

          } else {
            return Home();
          }

        },
      )
    );
  }
}
