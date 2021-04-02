import 'package:cached_network_image/cached_network_image.dart';
import 'package:event_follow/models/controllers/following_tweets/following_tweets_controller.dart';
import 'package:event_follow/models/controllers/friendships_controller/friendships_controller.dart';
import 'package:event_follow/models/entities/event.dart';
import 'package:event_follow/models/entities/event_extra.dart';
import 'package:event_follow/models/repositories/following_tweets/following_tweets_api_request.dart';
import 'package:event_follow/models/repositories/friendships/friendships_api_request.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'following_tweets_list_view.dart';

class FriendsFooter extends HookWidget {
  final Event _event;
  final EventExtra _extra;

  FriendsFooter(this._event, this._extra);

  @override
  Widget build(BuildContext context) {
    final controller = useProvider(friendshipsProvider);
    final followingTweetsController = useProvider(followingTweetsProvider);
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
            onTap: () async {
              followingTweetsController.request(FollowingTweetsApiRequest(
                  eventId: this._event.id.toString()));

              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Container(
                      constraints:
                          BoxConstraints(minHeight: 100, maxHeight: 600),
                      color: Colors.white,
                      child: FollowingTweetsListView(
                        eventId: this._event.id.toString(),
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
          Row(
            children: friends.map((friend) {
              return Container(
                  margin: const EdgeInsets.only(right: 5.0),
                  child: GestureDetector(
                    onTap: () {
                      launch("https://twitter.com/${friend.screenName}");
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      child: CachedNetworkImage(
                        imageUrl: friend.profileImage,
                        placeholder: (context, url) => Container(
                          color: const Color(0xffd7d7d8),
                          width: 30,
                          height: 30,
                        ),
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
