import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'event_list.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home"),),
      body: Center(
        child: RaisedButton(
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
      ),
    );
  }
}
