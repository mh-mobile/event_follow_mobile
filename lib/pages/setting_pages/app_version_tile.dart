import 'package:event_follow/utils/app_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppVersion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: AppUtils.getAppVersion(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return SizedBox.shrink();
        }

        return Container(
          margin: EdgeInsets.only(top: 10),
          child: Center(
            child: Text("ver ${snapshot.data as String}", style: TextStyle(color: Colors.grey[600])),
          ),
        );
      },
    );
  }
}
