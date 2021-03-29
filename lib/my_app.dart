import 'package:event_follow/main.dart';
import 'package:event_follow/pages/events_pages/events_page.dart';
import 'package:event_follow/pages/home_pages/home_page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: (firebaseAuth.currentUser != null) ? EventsPage() : HomePage(),
    );
  }
}
