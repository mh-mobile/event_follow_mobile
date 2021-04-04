import 'package:event_follow/utils/app_utils.dart';
import 'package:flutter/material.dart';

class LicenseTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        showAboutDialog(
          context: context,
          applicationName: await AppUtils.getAppName(),
          applicationVersion: await AppUtils.getAppVersion(),
          applicationIcon: await AppUtils.getAppIcon(),
          applicationLegalese: await AppUtils.getAppLegalese(),
        );
      },
      child: ListTile(
        title: Text(
          "ライセンス",
        ),
        dense: true,
      ),
    );
  }
}
