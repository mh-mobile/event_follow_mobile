import 'package:event_follow/main.dart';
import 'package:event_follow/pages/events_pages/friends_footer.dart';
import 'package:event_follow/pages/home_pages/home_page.dart';
import 'package:event_follow/pages/setting_pages/setting_page.dart';
import 'package:event_follow/repository/event_list_repository.dart';
import 'package:event_follow/ui/sort_filter_button.dart';
import 'package:event_follow/ui/sort_filter_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../extension/datetime_ex.dart';
import '../../extension/string_ex.dart';
import '../../extension/image_ex.dart';
import '../../config/sort_filter_globals.dart';

final sortFilterStateKey = GlobalKey<SortFilterButtonState>();
final eventListViewStateKey = GlobalKey<_EventListViewState>();

var sortFilterStateStore = SortFilterStateStore(
    sortType: SortType.FriendsNumber,
    friendFilterType:
    FriendsFilterType.ThreeOrMoreFriends,
    timeFilterType: TimeFilterType.SixDays);

class EventsPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset("assets/logo_notext.png", height: 30,),
        actions: [
          SortFilterButton(
              key: sortFilterStateKey,
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
                        eventListViewStateKey.currentState?.initCardList();
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
      body: EventListView(
          key: eventListViewStateKey
      ),
    );
  }
}

class EventListView extends StatefulWidget {

  const EventListView({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _EventListViewState();
  }
}

class _EventListViewState extends State<EventListView> {
  List<EventCard> _cardList = [];
  late ScrollController _scrollController;
  bool _isLoading = false;
  int _currentPage = 1;
  int _totalPages = 1;

  @override
  void initState() {
    initCardList();

    _scrollController = ScrollController();
    _scrollController.addListener(() {
      final maxScrollExtent = _scrollController.position.maxScrollExtent;
      final currentPosition = _scrollController.position.pixels;
      if (maxScrollExtent > 0 && (maxScrollExtent - 100.0) <= currentPosition) {
        _addCardList();
      }
    });
    super.initState();
  }

  void _setPagingInfo({int currentPage = 1, int totalPages = 1}) {
    _currentPage = currentPage;
    _totalPages = totalPages;
  }

  void initCardList() async {
    _setPagingInfo();

    final eventListRepository = EventListRepository(
        getOrGenerateIdToken: firebaseAuth.currentUser?.getIdToken);
    final eventListApiRequest = EventListApiRequest(
        pageId: "1",
        sort: sortFilterStateStore.sortType.typeName,
        time: sortFilterStateStore.timeFilterType!.typeName,
        friends: sortFilterStateStore.friendFilterType!.typeName);
    final results = await eventListRepository.requestEventListApi(
        request: eventListApiRequest);
    _setPagingInfo(currentPage: results.meta.currentPage, totalPages: results.meta.totalPages);

    sortFilterStateKey.currentState?.setCondition(sortFilterStateStore);
    setState(() {
      _cardList.clear();
      _cardList.addAll(results.data.map((datum) {
        final event = datum.event;
        final extra = datum.extra;
        return EventCard(event, extra, firebaseAuth.currentUser?.getIdToken);
      }));
    });
  }

  void _addCardList() async {
    if (_isLoading || !_hasNextPaging(_currentPage, _totalPages)) {
      return;
    }

    _isLoading = true;

    final eventListRepository = EventListRepository(
        getOrGenerateIdToken: firebaseAuth.currentUser?.getIdToken);
    final eventListApiRequest = EventListApiRequest(
        pageId: "${_currentPage + 1}",
        sort: sortFilterStateStore.sortType.typeName,
        time: sortFilterStateStore.timeFilterType!.typeName,
        friends: sortFilterStateStore.friendFilterType!.typeName);

    Future.delayed(Duration(milliseconds: 200), () async {
      final results = await eventListRepository.requestEventListApi(
          request: eventListApiRequest);
      _setPagingInfo(currentPage: results.meta.currentPage, totalPages: results.meta.totalPages);
      sortFilterStateKey.currentState?.setCondition(sortFilterStateStore);

      setState(() {
        _cardList.addAll(results.data.map((datum) {
          final event = datum.event;
          final extra = datum.extra;
          return EventCard(event, extra, firebaseAuth.currentUser?.getIdToken);
        }));
      });
      _isLoading = false;
    });
  }

  bool _hasNextPaging(int currentPage, int totalPages) {
    return currentPage < totalPages;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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

  Future<void> _onRefresh() async {
    initCardList();
  }

}

class EventCard extends StatelessWidget {
  final Event _event;
  final Extra _extra;
  final _getOrGenerateIdToken;

  EventCard(this._event, this._extra, this._getOrGenerateIdToken);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          launch(_event.url);
        },
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              child: IntrinsicHeight(
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 5.0),
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                color: const Color(0xfff0f1f5),
                                border: Border.all(
                                  color: Color(0xffc1c1c1),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    _event.startedAt.convertToEventDateFormat(),
                                    style: TextStyle(fontSize: 16.0),
                                  ),
                                  Text(
                                    "開催",
                                    style: TextStyle(fontSize: 12.0),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              child: ImageExtension.getEventLogoPath(
                                  _event.siteId),
                            ),
                            GestureDetector(
                              onTap: () {
                                final text =
                                    "\"${_event.title}\"\n${_event.url}";
                                launch(
                                    "twitter://post?message=${Uri.encodeFull(text)}");
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Container(
                                  width: 100,
                                  height: 20,
                                  color: Colors.blue,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset("assets/twitter_logo.png",
                                          height: 15.0),
                                      Text(
                                        "ツイート",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 10.0),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 8,
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        child: Column(
                          children: [
                            Expanded(
                                flex: 3,
                                child: Container(
                                  child: Row(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                          flex: 7,
                                          child: Container(
                                            child: Text(
                                              _event.title,
                                              style: TextStyle(
                                                  color: Colors.blue[800]),
                                            ),
                                          )),
                                      Expanded(
                                          flex: 3,
                                          child: Container(
                                            margin: EdgeInsets.only(
                                                right: 5, left: 5),
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  child: Image.network(
                                                    _event.banner,
                                                    height: 50,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ))
                                    ],
                                  ),
                                )),
                            Expanded(
                              flex: 7,
                              child: Container(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        child: Text(
                                          _event.description
                                              .removeAllHtmlTags()
                                              .stripEventDescription(),
                                          style: TextStyle(
                                            fontSize: 11,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            FriendsFooter(_event, _extra),
          ],
        ),
      ),
    );
  }
}
