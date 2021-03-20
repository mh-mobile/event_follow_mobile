import 'package:event_follow/ui/settings.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    child: Image.asset(
                      "assets/profile.png",
                      height: 60,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10.0),
                    child: Text(
                      "mh@mobiler",
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
    _cardList.add(EventCard(
        "イベント_1イベント_1イベント_1イベント_1イベント_1", "概要1", "https://example.com"));
    _cardList.add(EventCard("イベント_2", "概要2", "https://example.com"));
    _cardList.add(EventCard("イベント_3", "概要3", "https://example.com"));
    _cardList.add(EventCard("イベント_4", "概要4", "https://example.com"));
    _cardList.add(EventCard("イベント_5", "概要5", "https://example.com"));
    _cardList.add(EventCard("イベント_6", "概要6", "https://example.com"));
    super.initState();
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
  final String _name;
  final String _description;
  final String _url;

  EventCard(this._name, this._description, this._url);

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
                              Text("3/20",
                                style: TextStyle(
                                  fontSize: 16.0
                                ),
                              ),
                              Text("開催",
                                style: TextStyle(
                                  fontSize: 12.0
                                ),
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
                                        child: Text(_name),
                                      )),
                                  Expanded(
                                      flex: 2,
                                      child: Container(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              child: Image.asset(
                                                "assets/profile.png",
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
                                    child: Text("概要 Hirakata.rbは大阪府枚方市やその周辺の人々が集まる、朝活スタイルのRubyコミュニティです。（「マイカタ」ちゃいます、「ひらかた」です） 地域コミュニティですが、オンラインで開催するため世界のどこからでも参加できます。「初心者にとって参加ハードルが日本一低いRubyコミュニティ」を目指しています！ RubyやRails、その他周辺知識の勉強を目的としています。ホットな話題を議論したり雑談したりというよりは、質問しあったり、手を動かす場所にしたいです。 こんな人にオススメ Rub",
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
                Container(
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
                    child: Text("7"),
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
                  )
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
