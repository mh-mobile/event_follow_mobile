import 'package:event_follow/main.dart';
import 'package:event_follow/repository/event_list_repository.dart';
import 'package:event_follow/repository/following_tweets_repository.dart';
import 'package:event_follow/repository/friendships_repository.dart';
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
        return EventCard(event, extra, idToken!);
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
  final String _jwtToken;
  final FriendshipsRepository _friendshipsRepository;
  final FollowingTweetsRepository _followingTweetsRepository;

  EventCard(this._event, this._extra, this._jwtToken):
        _friendshipsRepository = FriendshipsRepository(jwtToken: _jwtToken),
        _followingTweetsRepository = FollowingTweetsRepository(jwtToken: _jwtToken);

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
                            child: FutureBuilder(
                              future: _followingTweetsRepository.requestFollowingTweetsApi(request: FollowingTweetsApiRequest(eventId: this._event.id.toString())),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState == ConnectionState.waiting) {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }

                                if (snapshot.error != null) {
                                  return Center(
                                    child: Text("エラーが発生しました"),
                                  );
                                }

                                final results = snapshot.data! as FollowingTweetsApiResults;
                                final tweets = results.tweets;

                                return ListView.separated(
                                    itemCount: tweets.length,
                                    separatorBuilder: (context, index) {
                                      return Divider(
                                        color: Colors.black12,
                                        height: 1,
                                      );
                                    },
                                    itemBuilder: (context, index) {
                                      final tweet = tweets[index];
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
                                                        child: Image.network(
                                                          tweet.user.profileImage,
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
                                                    Row(
                                                      children: [
                                                        Text(tweet.user.name,
                                                            style: TextStyle(
                                                                color: Colors.blue[800],
                                                                fontSize: 12)),
                                                        Text("@${tweet.user.screenName}",
                                                            style: TextStyle(
                                                                color: Colors.grey,
                                                                fontSize: 12)),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                      tweet.text,
                                                      style:
                                                      TextStyle(fontSize: 12),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                      tweet.tweetedAt.toString(),
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
                                    });
                              }, 
                            ),
                            
                            
                            

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

                FutureBuilder(
                  future: _friendshipsRepository.requestFriendshipsApi(request: FriendshipsApiRequest(userIds: this._extra.userIds)),
                  builder: (context, snapshot) {

                    if (!snapshot.hasData) {
                      return SizedBox.shrink();
                    }

                    if (snapshot.data != "") {
                      final friendshipsApiResults = snapshot.data! as FriendshipsApiResults;
                      return Row(
                        children: friendshipsApiResults.friends.map((friend) {
                          return Container(
                              margin: const EdgeInsets.only(right: 5.0),
                              child: GestureDetector(
                                onTap: () {
                                  launch("https://twitter.com/${friend.screenName}");
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.all(Radius.circular(50)),
                                  child: Image.network(
                                    friend.profileImage,
                                    height: 30,
                                  ),
                                ),
                              ));
                        }).toList(),
                      );
                    } else {
                      return SizedBox.shrink();
                    }
                  },
                ) ,


              ],
            ),
          )
        ],
      ),
    );
  }
}
