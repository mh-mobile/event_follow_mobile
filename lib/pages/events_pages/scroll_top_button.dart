import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ScrollTopButton extends HookWidget {
  const ScrollTopButton({required this.scrollController});

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: true,
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
