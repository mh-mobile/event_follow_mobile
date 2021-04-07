import 'package:event_follow/config/sort_filter_globals.dart';
import 'package:event_follow/models/controllers/events_controller/events_controller.dart';
import 'package:event_follow/models/repositories/events/events_api_request.dart';
import 'package:event_follow/pages/events_pages/event_drawer_header.dart';
import 'package:event_follow/pages/events_pages/scroll_top_button.dart';
import 'package:event_follow/pages/events_pages/sort_filter_button.dart';
import 'package:event_follow/pages/events_pages/sort_filter_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'event_list_view.dart';

class EventsPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final controller = useProvider(eventsProvider);
    final meta =
        useProvider(eventsProvider.state.select((value) => value.meta));
    final isLoading =
        useProvider(eventsProvider.state.select((value) => value.isLoading));
    final sortFilterStateStore = useProvider(eventsConditionProvider).state;

    late final _scrollController = () {
      final _scrollController = ScrollController();
      _scrollController.addListener(() {
        final maxScrollExtent = _scrollController.position.maxScrollExtent;
        final currentPosition = _scrollController.position.pixels;

        context.read(eventsScrollPositionProvider).state = currentPosition;

        if (maxScrollExtent > 0 &&
            (maxScrollExtent - 100.0) <= currentPosition) {
          final currentPage = meta?.currentPage ?? 1;
          final totalPages = meta?.totalPages ?? 1;
          if (!isLoading && _hasNextPaging(currentPage, totalPages)) {
            final nextPageId = (meta?.currentPage ?? 1) + 1;

            controller.request(EventsApiRequest(
                pageId: nextPageId.toString(),
                sort: sortFilterStateStore?.sortType.typeName,
                time: sortFilterStateStore?.timeFilterType?.typeName,
                friends: sortFilterStateStore?.friendFilterType?.typeName));
          }
        }
      });
      return _scrollController;
    }();

    Future<void> _onRefresh() async {
      await controller.request(EventsApiRequest(
          pageId: initialPageId,
          sort: sortFilterStateStore?.sortType.typeName,
          time: sortFilterStateStore?.timeFilterType?.typeName,
          friends: sortFilterStateStore?.friendFilterType?.typeName));
    }

    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/logo_notext.png',
          height: 30,
        ),
        actions: [
          SortFilterButton(onTap: () {
            showGeneralDialog(
              context: context,
              barrierDismissible: true,
              transitionDuration: const Duration(milliseconds: 300),
              barrierLabel: 'sort&filter',
              barrierColor: Colors.black.withOpacity(0.5),
              pageBuilder: (context, _, __) {
                return SortFilterDialog(
                  onChange: (store) {
                    controller.request(EventsApiRequest(
                        pageId: initialPageId,
                        sort: store.sortType.typeName,
                        time: store.timeFilterType?.typeName,
                        friends: store.friendFilterType?.typeName));
                  },
                );
              },
              transitionBuilder:
                  (context, animation, secondaryAnimation, child) {
                return SlideTransition(
                  position:
                      CurvedAnimation(parent: animation, curve: Curves.easeOut)
                          .drive(Tween<Offset>(
                    begin: const Offset(0, -1),
                    end: Offset.zero,
                  )),
                  child: child,
                );
              },
            );
          })
        ],
      ),
      drawer: EventDrawerHeader(),
      body: EventListView(
        scrollController: _scrollController,
        onRefresh: _onRefresh,
      ),
      floatingActionButton: ScrollTopButton(
        scrollController: _scrollController,
      ),
    );
  }

  bool _hasNextPaging(int currentPage, int totalPages) {
    return currentPage < totalPages;
  }
}
