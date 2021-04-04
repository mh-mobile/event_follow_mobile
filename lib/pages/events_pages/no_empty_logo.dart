import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class NoEmptyLogo extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Image.asset(
      "assets/logo_transparent.png",
      height: 80,
    ));
  }
}
