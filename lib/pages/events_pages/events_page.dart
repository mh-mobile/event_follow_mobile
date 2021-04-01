import 'package:event_follow/models/controllers/events_controller/events_controller.dart';
import 'package:event_follow/models/repositories/events/events_repository.dart';
import 'package:event_follow/pages/events_pages/event_card.dart';
import 'package:event_follow/pages/events_pages/event_drawer_header.dart';
import 'package:event_follow/ui/sort_filter_button.dart';
import 'package:event_follow/ui/sort_filter_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../config/sort_filter_globals.dart';
import 'no_empty_logo.dart';

final sortFilterStateKey = GlobalKey<SortFilterButtonState>();

class EventsPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final controller = useProvider(eventsProvider);
    final sortFilterStateStore = useProvider(eventsConditionProvider).state;
    if (sortFilterStateStore != null) {
      sortFilterStateKey.currentState?.setCondition(sortFilterStateStore);
    }

    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "assets/logo_notext.png",
          height: 30,
        ),
        actions: [
          SortFilterButton(
              key: sortFilterStateKey,
              selectedStateStore: sortFilterStateStore,
              onTap: () {
                showGeneralDialog(
                  context: context,
                  barrierDismissible: true,
                  transitionDuration: Duration(milliseconds: 300),
                  barrierLabel: "sort&filter",
                  barrierColor: Colors.black.withOpacity(0.5),
                  pageBuilder: (context, _, __) {
                    return SortFilterDialog(
                      store: sortFilterStateStore!,
                      onChange: (store) {
                        sortFilterStateKey.currentState?.setCondition(store);

                        controller.request(EventsApiRequest(
                            pageId: "1",
                            sort: store.sortType.typeName,
                            time: store.timeFilterType?.typeName,
                            friends: store.friendFilterType?.typeName));
                      },
                    );
                  },
                  transitionBuilder:
                      (context, animation, secondaryAnimation, child) {
                    return SlideTransition(
                      position: CurvedAnimation(
                              parent: animation, curve: Curves.easeOut)
                          .drive(Tween<Offset>(
                        begin: Offset(0, -1.0),
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
      body: EventListView(),
    );
  }
}

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
      return RefreshIndicator(
          onRefresh: _onRefresh,
          child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    NoEmptyLogo(),
                    SizedBox(height: 20.0,),
                    Text("イベントがまだありません", style: TextStyle(fontWeight: FontWeight.bold),),
                  ],
                ),
                height: MediaQuery.of(context).size.height - 200,
                width: MediaQuery.of(context).size.width,
              )));
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
