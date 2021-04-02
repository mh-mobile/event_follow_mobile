import 'package:cached_network_image/cached_network_image.dart';
import 'package:event_follow/models/controllers/following_tweets/following_tweets_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:event_follow/extension/datetime_ex.dart';

class FollowingTweetsListView extends HookWidget {
  final eventId;

  FollowingTweetsListView({
    required this.eventId,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tweets = useProvider(
        followingTweetsProvider.state.select((value) => value.tweets));
    final isLoading = useProvider(
        followingTweetsProvider.state.select((value) => value.isLoading));

    return Container(
      constraints: BoxConstraints(minHeight: 100, maxHeight: 600),
      color: Colors.white,
      child: !isLoading
          ? ListView.separated(
              itemCount: tweets.length,
              shrinkWrap: true,
              separatorBuilder: (context, index) {
                return Divider(
                  color: Colors.black12,
                  height: 1,
                );
              },
              itemBuilder: (context, index) {
                final tweet = tweets[index];
                return Container(
                  margin: EdgeInsets.only(top: 5, bottom: 5, right: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          child: Column(
                            children: [
                              Container(
                                child: GestureDetector(
                                  onTap: () {
                                    launch(
                                        "https://twitter.com/${tweet.user.screenName}");
                                  },
                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50)),
                                    child: CachedNetworkImage(
                                      imageUrl: tweet.user.profileImage,
                                      placeholder: (context, url) => Container(
                                        color: const Color(0xffd7d7d8),
                                        width: 30,
                                        height: 30,
                                      ),
                                      height: 30,
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
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(tweet.user.name,
                                      style: TextStyle(
                                          color: Colors.blue[800],
                                          fontSize: 12)),
                                  Text("@${tweet.user.screenName}",
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 12)),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Linkify(
                                onOpen: (link) async {
                                  if (await canLaunch(link.url)) {
                                    await launch(link.url);
                                  }
                                },
                                text: tweet.text,
                                style: TextStyle(fontSize: 12),
                                linkStyle: TextStyle(
                                    color: Colors.blue[800], fontSize: 12),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                tweet.tweetedAt.convertToTweetDateFormat(),
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                );
              })
          : Center(child: CircularProgressIndicator()),
    );
  }
}
