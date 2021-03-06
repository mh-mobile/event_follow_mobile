import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'no_empty_logo.dart';

class EventEmptyView extends HookWidget {
  const EventEmptyView({
    required this.onRefresh,
  });

  final RefreshCallback onRefresh;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        onRefresh: onRefresh,
        child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: SizedBox(
              height: MediaQuery.of(context).size.height - 200,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NoEmptyLogo(),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'イベントがまだありません',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )));
  }
}
