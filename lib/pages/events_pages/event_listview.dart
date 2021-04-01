import 'package:event_follow/models/controllers/events_controller/events_controller.dart';
import 'package:event_follow/models/repositories/events/events_repository.dart';
import 'package:event_follow/pages/events_pages/event_empty_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../config/sort_filter_globals.dart';
import 'event_card.dart';
import 'no_empty_logo.dart';

class EventListView extends HookWidget {
  const EventListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = useProvider(eventsProvider);
    final data =
    useProvider(eventsProvider.state.select((value) => value.data));
    final meta =
    useProvider(eventsProvider.state.select((value) => value.meta));
    final isLoading =
    useProvider(eventsProvider.state.select((value) => value.isLoading));
    final sortFilterStateStore = useProvider(eventsConditionProvider).state;

    final _cardList =
    data.map((datum) => EventCard(datum.event, datum.extra)).toList();

    Future<void> _onRefresh() async {
      controller.request(EventsApiRequest(
          pageId: "1",
          sort: sortFilterStateStore?.sortType.typeName,
          time: sortFilterStateStore?.timeFilterType!.typeName,
          friends: sortFilterStateStore?.friendFilterType!.typeName));
    }

    late ScrollController _scrollController = () {
      var _scrollController = ScrollController();
      _scrollController.addListener(() {
        final maxScrollExtent = _scrollController.position.maxScrollExtent;
        final currentPosition = _scrollController.position.pixels;
        if (maxScrollExtent > 0 &&
            (maxScrollExtent - 100.0) <= currentPosition) {
          final currentPage = meta?.currentPage ?? 1;
          final totalPages = meta?.totalPages ?? 1;
          if (!isLoading && _hasNextPaging(currentPage, totalPages)) {
            final nextPageId = (meta?.currentPage ?? 1) + 1;

            controller.request(EventsApiRequest(
                pageId: nextPageId.toString(),
                sort: sortFilterStateStore?.sortType.typeName,
                time: sortFilterStateStore?.timeFilterType!.typeName,
                friends: sortFilterStateStore?.friendFilterType!.typeName));
          }
        }
      });
      return _scrollController;
    }();

    if (!isLoading && data.length == 0) {
      return EventEmptyView(onRefresh: _onRefresh);
    }

    return (isLoading && data.length == 0)
        ? Center(
      child: CircularProgressIndicator(),
    )
        : Container(
      padding: EdgeInsets.all((8)),
      child: RefreshIndicator(
        onRefresh: _onRefresh,
        child: ListView.builder(
            itemCount: _cardList.length,
            shrinkWrap: true,
            physics: const AlwaysScrollableScrollPhysics(),
            controller: _scrollController,
            itemBuilder: (context, index) {
              return _cardList[index];
            }),
      ),
    );
  }

  bool _hasNextPaging(int currentPage, int totalPages) {
    return currentPage < totalPages;
  }
}
