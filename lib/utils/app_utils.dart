import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';

class AppUtils {
  static Future<String> getAppVersion() async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }

  static Future<String> getAppName() async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.appName;
  }

  static Future<Image> getAppIcon({double width = 40}) async {
    return Image.asset('assets/logo_notext.png', width: width);
  }

  static Future<String> getAppLegalese() async {
    return '2021 mh-mobile';
  }
}
