import 'package:event_follow/main.dart';
import 'package:event_follow/ui/event_list.dart';
import 'package:event_follow/ui/home.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: (firebaseAuth.currentUser != null) ? EventList() : Home(),
    );
  }
}
