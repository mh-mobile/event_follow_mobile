import 'package:event_follow/models/controllers/friendships_controller/friendships_controller.dart';
import 'package:event_follow/models/models.dart';
import 'package:event_follow/repository/event_list_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class FriendsFooter extends HookWidget {
  final Event _event;
  final Extra _extra;

  FriendsFooter(this._event, this._extra);

  @override
  Widget build(BuildContext context) {
    final controller = useProvider(friendshipsProvider);
    final friends = useProvider(friendshipsProvider.state
            .select((value) => value.friendsData[this._event.id])) ??
        [];
    final isLoading = useProvider(friendshipsProvider.state
            .select((value) => value.loadingData[this._event.id])) ??
        false;

    useEffect(() {
      if (isLoading || friends.length > 0) return;
      controller.requestFriendships(
          FriendshipsApiRequest(userIds: this._extra.userIds), this._event.id);
    });

    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          GestureDetector(
            onTap: () {
              // showModalBottomSheet(
              //     context: context,
              //     builder: (context) {
              //       return Container(
              //         constraints:
              //             BoxConstraints(minHeight: 100, maxHeight: 600),
              //         color: Colors.white,
              //         child: FutureBuilder(
              //           future: _followingTweetsRepository
              //               .requestFollowingTweetsApi(
              //                   request: FollowingTweetsApiRequest(
              //                       eventId: this._event.id.toString())),
              //           builder: (context, snapshot) {
              //             if (snapshot.connectionState ==
              //                 ConnectionState.waiting) {
              //               return Center(
              //                 child: CircularProgressIndicator(),
              //               );
              //             }
              //
              //             if (snapshot.error != null) {
              //               return Center(
              //                 child: Text("エラーが発生しました"),
              //               );
              //             }
              //
              //             final results =
              //                 snapshot.data! as FollowingTweetsApiResults;
              //             final tweets = results.tweets;
              //
              //             return ListView.separated(
              //                 itemCount: tweets.length,
              //                 shrinkWrap: true,
              //                 separatorBuilder: (context, index) {
              //                   return Divider(
              //                     color: Colors.black12,
              //                     height: 1,
              //                   );
              //                 },
              //                 itemBuilder: (context, index) {
              //                   final tweet = tweets[index];
              //                   return Container(
              //                     margin: EdgeInsets.only(
              //                         top: 5, bottom: 5, right: 10),
              //                     child: Row(
              //                       crossAxisAlignment:
              //                           CrossAxisAlignment.start,
              //                       children: [
              //                         Expanded(
              //                           flex: 2,
              //                           child: Container(
              //                             child: Column(
              //                               children: [
              //                                 Container(
              //                                   child: GestureDetector(
              //                                     onTap: () {
              //                                       launch(
              //                                           "https://twitter.com/${tweet.user.screenName}");
              //                                     },
              //                                     child: ClipRRect(
              //                                       borderRadius:
              //                                           BorderRadius.all(
              //                                               Radius.circular(
              //                                                   50)),
              //                                       child: Image.network(
              //                                         tweet.user.profileImage,
              //                                         height: 30,
              //                                       ),
              //                                     ),
              //                                   ),
              //                                 ),
              //                               ],
              //                             ),
              //                           ),
              //                         ),
              //                         Expanded(
              //                           flex: 8,
              //                           child: Container(
              //                             child: Column(
              //                               crossAxisAlignment:
              //                                   CrossAxisAlignment.start,
              //                               children: [
              //                                 Row(
              //                                   children: [
              //                                     Text(tweet.user.name,
              //                                         style: TextStyle(
              //                                             color:
              //                                                 Colors.blue[800],
              //                                             fontSize: 12)),
              //                                     Text(
              //                                         "@${tweet.user.screenName}",
              //                                         style: TextStyle(
              //                                             color: Colors.grey,
              //                                             fontSize: 12)),
              //                                   ],
              //                                 ),
              //                                 SizedBox(
              //                                   height: 5,
              //                                 ),
              //                                 Linkify(
              //                                   onOpen: (link) async {
              //                                     if (await canLaunch(
              //                                         link.url)) {
              //                                       await launch(link.url);
              //                                     }
              //                                   },
              //                                   text: tweet.text,
              //                                   style: TextStyle(fontSize: 12),
              //                                   linkStyle: TextStyle(
              //                                       color: Colors.blue[800],
              //                                       fontSize: 12),
              //                                 ),
              //                                 SizedBox(
              //                                   height: 5,
              //                                 ),
              //                                 Text(
              //                                   tweet.tweetedAt
              //                                       .convertToTweetDateFormat(),
              //                                   style: TextStyle(
              //                                       color: Colors.grey),
              //                                 ),
              //                               ],
              //                             ),
              //                           ),
              //                         )
              //                       ],
              //                     ),
              //                   );
              //                 });
              //           },
              //         ),
              //       );
              //     });
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
          isLoading
              ? SizedBox.shrink()
              : Row(
                  children: friends.map((friend) {
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
                )
        ],
      ),
    );
  }
}
