import 'package:event_follow/models/controllers/events_controller/events_controller.dart';
import 'package:event_follow/models/controllers/events_controller/events_status.dart';
import 'package:event_follow/pages/events_pages/event_content_view.dart';
import 'package:event_follow/pages/events_pages/event_empty_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'event_card.dart';

class EventListView extends HookWidget {
  const EventListView({
    required this.scrollController,
    required this.onRefresh,
    Key? key,
  }) : super(key: key);

  final ScrollController scrollController;
  final RefreshCallback onRefresh;

  @override
  Widget build(BuildContext context) {
    final data =
        useProvider(eventsProvider.state.select((value) => value.data));
    final eventsStatus =
        useProvider(eventsProvider.state.select((value) => value.status));
    final _cardList =
        data.map((datum) => EventCard(datum.event, datum.extra)).toList();

    if (eventsStatus is EventsEmpty ||
        (eventsStatus is EventsSuccess && data.isEmpty)) {
      return EventEmptyView(onRefresh: onRefresh);
    }

    if (eventsStatus is EventsInProgress && data.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (eventsStatus is EventsFailure) {
      return EventEmptyView(onRefresh: onRefresh);
    }

    return EventContentView(
        onRefresh: onRefresh,
        scrollController: scrollController,
        cardList: _cardList);
  }
}
