import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class EventListRepository {
  final getOrGenerateIdToken;

  EventListRepository({required this.getOrGenerateIdToken});

  Future<EventListApiResults> requestEventListApi(
      {required EventListApiRequest request}) async {
    final url = Uri.https("event-follow-front.herokuapp.com",
        "/api/events", request.toParams());

    final response = await http.get(
      url,
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader: "Bearer ${await this.getOrGenerateIdToken()}"
      },
    );
    return EventListApiResults.fromJson(json.decode(response.body));
  }
}

class EventListApiRequest {
  final String pageId;
  final String sort;
  final String time;
  final String friends;

  EventListApiRequest({
    required this.pageId,
    required this.sort,
    required this.time,
    required this.friends,
  });

  Map<String, String> toParams() => {
        "page": this.pageId,
        "sort": this.sort,
        "time": this.time,
        "friends": this.friends,
      };
}

class EventListApiResults {
  EventListApiResults({
    required this.meta,
    required this.data,
  });

  Meta meta;
  List<Datum> data;

  factory EventListApiResults.fromJson(Map<String, dynamic> json) =>
      EventListApiResults(
        meta: Meta.fromJson(json["meta"]),
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "meta": meta.toJson(),
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.event,
    required this.extra,
  });

  Event event;
  Extra extra;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        event: Event.fromJson(json["event"]),
        extra: Extra.fromJson(json["extra"]),
      );

  Map<String, dynamic> toJson() => {
        "event": event.toJson(),
        "extra": extra.toJson(),
      };
}

class Event {
  Event({
    required this.id,
    required this.siteId,
    required this.siteEventId,
    required this.title,
    required this.startedAt,
    required this.endedAt,
    required this.banner,
    required this.url,
    required this.description,
  });

  int id;
  int siteId;
  int siteEventId;
  String title;
  DateTime startedAt;
  DateTime endedAt;
  String banner;
  String url;
  String description;

  factory Event.fromJson(Map<String, dynamic> json) => Event(
        id: json["id"],
        siteId: json["site_id"],
        siteEventId: json["site_event_id"],
        title: json["title"],
        startedAt: DateTime.parse(json["started_at"]),
        endedAt: DateTime.parse(json["ended_at"]),
        banner: json["banner"],
        url: json["url"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "site_id": siteId,
        "site_event_id": siteEventId,
        "title": title,
        "started_at": startedAt.toIso8601String(),
        "ended_at": endedAt.toIso8601String(),
        "banner": banner,
        "url": url,
        "description": description,
      };
}

class Extra {
  Extra({
    required this.userIds,
    required this.friendsNumber,
  });

  String userIds;
  int friendsNumber;

  factory Extra.fromJson(Map<String, dynamic> json) => Extra(
        userIds: json["user_ids"],
        friendsNumber: json["friends_number"],
      );

  Map<String, dynamic> toJson() => {
        "user_ids": userIds,
        "friends_number": friendsNumber,
      };
}

class Meta {
  Meta({
    required this.currentPage,
    this.prevPage,
    this.nextPage,
    required this.limitValue,
    required this.totalPages,
    required this.totalCount,
    required this.eventSortType,
    required this.timeFilterType,
    required this.friendsFilterType,
  });

  int currentPage;
  dynamic prevPage;
  dynamic nextPage;
  int limitValue;
  int totalPages;
  int totalCount;
  String eventSortType;
  String timeFilterType;
  String friendsFilterType;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        currentPage: json["current_page"],
        prevPage: json["prev_page"],
        nextPage: json["next_page"],
        limitValue: json["limit_value"],
        totalPages: json["total_pages"],
        totalCount: json["total_count"],
        eventSortType: json["event_sort_type"],
        timeFilterType: json["time_filter_type"],
        friendsFilterType: json["friends_filter_type"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "prev_page": prevPage,
        "next_page": nextPage,
        "limit_value": limitValue,
        "total_pages": totalPages,
        "total_count": totalCount,
        "event_sort_type": eventSortType,
        "time_filter_type": timeFilterType,
        "friends_filter_type": friendsFilterType,
      };
}
