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
  const FriendsFooter(this._event, this._extra);

  final Event _event;
  final EventExtra _extra;

  @override
  Widget build(BuildContext context) {
    final controller = useProvider(friendshipsProvider);
    final followingTweetsController = useProvider(followingTweetsProvider);
    final friends = useProvider(friendshipsProvider.state
            .select((value) => value.friendsData[_event.id])) ??
        [];
    final isLoading = useProvider(friendshipsProvider.state
            .select((value) => value.loadingData[_event.id])) ??
        false;

    useEffect(() {
      if (isLoading || friends.isNotEmpty) {
        return;
      }

      controller.requestFriendships(
          FriendshipsApiRequest(userIds: _extra.userIds), _event.id);
    });

    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      child: Wrap(
        alignment: WrapAlignment.start,
        runSpacing: 5,
        children: [
          GestureDetector(
            onTap: () {
              followingTweetsController.request(
                  FollowingTweetsApiRequest(eventId: _event.id.toString()));

              showModalBottomSheet<void>(
                  context: context,
                  builder: (context) {
                    return Container(
                      constraints:
                          const BoxConstraints(minHeight: 100, maxHeight: 600),
                      color: Colors.white,
                      child: const FollowingTweetsListView(),
                    );
                  });
            },
            child: Container(
              margin: const EdgeInsets.only(right: 5),
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: const Color(0xffebe4df),
                border: Border.all(
                  color: const Color(0xffc1c1c1),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: Text('${_extra.friendsNumber}'),
              ),
            ),
          ),
          ...friends.map((friend) {
            return Container(
                margin: const EdgeInsets.only(right: 5),
                child: GestureDetector(
                  onTap: () {
                    launch('https://twitter.com/${friend.screenName}');
                  },
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(50)),
                    child: CachedNetworkImage(
                      imageUrl: friend.profileImage,
                      placeholder: (context, url) => Container(
                        color: const Color(0xffd7d7d8),
                        width: 30,
                        height: 30,
                      ),
                      errorWidget: (_, __, dynamic ___) {
                        return Container(
                          color: const Color(0xffd7d7d8),
                          width: 30,
                          height: 30,
                        );
                      },
                      height: 30,
                    ),
                  ),
                ));
          }).toList()
        ],
      ),
    );
  }
}
