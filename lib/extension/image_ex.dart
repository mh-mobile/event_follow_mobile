import 'dart:ui';
import 'package:flutter/material.dart';

extension ImageExtension on Image {
  static Image getEventLogoPath(int eventSiteId) {
    final path;
    switch (eventSiteId) {
      case 1:
        path = "assets/connpass_logo.png";
        break;
      case 2:
        path = "assets/doorkeeper_logo.png";
        break;
      default:
        path = "";
        break;
    }

    return Image.asset(
      path,
      height: 25,
    );
  }
}
