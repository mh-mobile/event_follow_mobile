import 'package:event_follow/main.dart';
import 'package:event_follow/models/controllers/events_controller/events_controller.dart';
import 'package:event_follow/models/repositories/events/events_repository.dart';
import 'package:event_follow/pages/events_pages/event_card.dart';
import 'package:event_follow/pages/home_pages/home_page.dart';
import 'package:event_follow/pages/setting_pages/setting_page.dart';
import 'package:event_follow/ui/sort_filter_button.dart';
import 'package:event_follow/ui/sort_filter_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../config/sort_filter_globals.dart';

final sortFilterStateKey = GlobalKey<SortFilterButtonState>();
// final eventListViewStateKey = GlobalKey<_EventListViewState>();

var sortFilterStateStore = SortFilterStateStore(
    sortType: SortType.FriendsNumber,
    friendFilterType: FriendsFilterType.ThreeOrMoreFriends,
    timeFilterType: TimeFilterType.SixDays);

class EventsPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final controller = useProvider(eventsProvider);

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
                      store: sortFilterStateStore,
                      onChange: (store) {
                        sortFilterStateStore = store;
                        sortFilterStateKey.currentState?.setCondition(store);

                        controller.request(EventsApiRequest(
                            pageId: "1",
                            sort: store.sortType.typeName,
                            time: store.timeFilterType!.typeName,
                            friends: store.friendFilterType!.typeName));

                        // eventListViewStateKey.currentState?.initCardList();
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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      height: 60,
                      child: Container(
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.network(
                              firebaseAuth.currentUser!.photoURL!,
                              fit: BoxFit.cover,
                            )),
                      )),
                  Container(
                    margin: EdgeInsets.only(top: 10.0),
                    child: Text(
                      firebaseAuth.currentUser!.displayName!,
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text("設定"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SettingPage();
                }));
              },
            ),
            ListTile(
              title: Text("ログアウト"),
              onTap: () {
                firebaseAuth.signOut();
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, _, __) => HomePage(),
                    transitionDuration: Duration(seconds: 0),
                  ),
                );
              },
            )
          ],
        ),
      ),
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
    print(isLoading);

    final _cardList =
        data.map((datum) => EventCard(datum.event, datum.extra)).toList();

    Future<void> _onRefresh() async {
      controller.request(EventsApiRequest(
          pageId: "1",
          sort: "friends_number_order",
          time: "past_8_hours",
          friends: "one_or_more_friends"));
    }

    late ScrollController _scrollController = () {
      var _scrollController = ScrollController();
      _scrollController.addListener(() {
        final maxScrollExtent = _scrollController.position.maxScrollExtent;
        final currentPosition = _scrollController.position.pixels;
        if (maxScrollExtent > 0 &&
            (maxScrollExtent - 100.0) <= currentPosition) {
          // _addCardList();
        }
      });
      return _scrollController;
    }();

    print(isLoading);
    return !isLoading
        ? Container(
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
          )
        : Center(
            child: CircularProgressIndicator(),
          );
  }

  bool _hasNextPaging(int currentPage, int totalPages) {
    return currentPage < totalPages;
  }
}
