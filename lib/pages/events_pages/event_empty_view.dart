import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'no_empty_logo.dart';

class EventEmptyView extends HookWidget {
  final onRefresh;

  const EventEmptyView({
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        onRefresh: onRefresh,
        child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NoEmptyLogo(),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'イベントがまだありません',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              height: MediaQuery.of(context).size.height - 200,
              width: MediaQuery.of(context).size.width,
            )));
  }
}
