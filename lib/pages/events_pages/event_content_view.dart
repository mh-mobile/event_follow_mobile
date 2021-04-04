import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'event_card.dart';

class EventContentView extends HookWidget {
  final onRefresh;
  final scrollController;
  final List<EventCard> cardList;

  const EventContentView({
    required this.onRefresh,
    required this.scrollController,
    required this.cardList,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all((8)),
      child: RefreshIndicator(
        onRefresh: onRefresh,
        child: ListView.builder(
            itemCount: cardList.length,
            shrinkWrap: true,
            physics: const AlwaysScrollableScrollPhysics(),
            controller: scrollController,
            itemBuilder: (context, index) {
              return cardList[index];
            }),
      ),
    );
  }
}
