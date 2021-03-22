import 'package:event_follow/main.dart';
import 'package:event_follow/repository/event_list_repository.dart';
import 'package:event_follow/ui/settings.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'home.dart';

class EventList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("イベント一覧"),
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
                  return Settings();
                }));
              },
            ),
            ListTile(
              title: Text("ログアウト"),
              onTap: () {
                firebaseAuth.signOut();
                storage.delete(key: "jwt_token");
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, _, __) => Home(),
                    transitionDuration: Duration(seconds: 0),
                  ),
                );
              },
            )
          ],
        ),
      ),
      body: Center(
        child: EventListView(),
      ),
    );
  }
}

class EventListView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _EventListViewState();
  }
}

class _EventListViewState extends State<EventListView> {
  List<EventCard> _cardList = [];

  @override
  void initState() {
    super.initState();
    initCardList();
  }

  void initCardList() async {
    final idToken = await firebaseAuth.currentUser?.getIdToken();
    final eventListRepository = EventListRepository(jwtToken: idToken);
    final eventListApiRequest = EventListApiRequest(
        pageId: "1",
        sort: "friends_number_order",
        time: "past_6_days",
        friends: "five_or_more_friends"
    );
    final results = await eventListRepository.requestEventListApi(request: eventListApiRequest);
    setState(() {
      _cardList.addAll(results.data.map((datum) {
        final event = datum.event;
        final extra = datum.extra;
        return EventCard(event, extra);
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all((8)),
      child: ListView.builder(
          itemCount: _cardList.length,
          itemBuilder: (context, index) {
            return _cardList[index];
          }),
    );
  }
}

class EventCard extends StatelessWidget {
  final Event _event;
  final Extra _extra;

  EventCard(this._event, this._extra);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            height: 250,
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
                                "3/20",
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
                          child: Image.asset(
                            "assets/connpass_logo.png",
                            height: 25,
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                      flex: 8,
                                      child: Container(
                                        child: Text(_event.title),
                                      )),
                                  Expanded(
                                      flex: 2,
                                      child: Container(
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
                                      _event.description,
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
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Container(
                            height: 800,
                            color: Colors.white,
                            child: ListView.separated(
                                itemCount: 20,
                                separatorBuilder: (context, index) {
                                  return Divider(
                                    color: Colors.black12,
                                    height: 1,
                                  );
                                },
                                itemBuilder: (context, index) {
                                  return Container(
                                    margin: EdgeInsets.only(
                                        top: 5, bottom: 5, right: 10),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: Container(
                                            child: Column(
                                              children: [
                                                Container(
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                50)),
                                                    child: Image.asset(
                                                      "assets/profile.png",
                                                      height: 30,
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
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text("mh_mobile",
                                                    style: TextStyle(
                                                        color: Colors.blue[800],
                                                        fontSize: 12)),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  "RT: イベントを開催します",
                                                  style:
                                                      TextStyle(fontSize: 12),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  "2021/03/20 12:22",
                                                  style: TextStyle(
                                                      color: Colors.grey),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                }),
                          );
                        });
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 5.0),
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: const Color(0xfff0f1f5),
                      border: Border.all(
                        color: Color(0xffc1c1c1),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text("${_extra.friendsNumber}"),
                    ),
                  ),
                ),
                Container(
                    margin: const EdgeInsets.only(right: 5.0),
                    child: GestureDetector(
                      onTap: () {
                        launch("https://twitter.com/mh_mobiler");
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        child: Image.asset(
                          "assets/profile.png",
                          height: 30,
                        ),
                      ),
                    )),
                Container(
                  margin: const EdgeInsets.only(right: 5.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    child: Image.asset(
                      "assets/profile.png",
                      height: 30,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 5.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    child: Image.asset(
                      "assets/profile.png",
                      height: 30,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 5.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    child: Image.asset(
                      "assets/profile.png",
                      height: 30,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
