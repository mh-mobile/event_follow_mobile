import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class EventErrorView extends HookWidget {
  const EventErrorView({
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
                children: const [
                  Icon(
                    Icons.error,
                    color: Colors.redAccent,
                    size: 100,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    '通信エラーが発生しました。\n再度試行してください。',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )));
  }
}
