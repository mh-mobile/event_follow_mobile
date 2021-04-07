import 'package:event_follow/models/controllers/events_controller/events_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ScrollTopButton extends HookWidget {
  const ScrollTopButton({required this.scrollController});

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    final topScrollButtonVisilibity =
        useProvider(eventsTopScrollButtonVisibilityProvider);

    return Visibility(
      visible: topScrollButtonVisilibity,
      child: FloatingActionButton(
        onPressed: () {
          scrollController.animateTo(0,
              duration: const Duration(milliseconds: 300),
              curve: Curves.linear);
        },
        child: const Icon(Icons.arrow_upward),
      ),
    );
  }
}
