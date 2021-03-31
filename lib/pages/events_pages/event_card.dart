import 'package:event_follow/models/entities/event.dart';
import 'package:event_follow/models/entities/event_extra.dart';
import 'package:event_follow/pages/events_pages/friends_footer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../extension/datetime_ex.dart';
import '../../extension/string_ex.dart';
import '../../extension/image_ex.dart';

class EventCard extends HookWidget {
  final Event _event;
  final EventExtra _extra;

  EventCard(this._event, this._extra);

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