import 'dart:convert';
import 'dart:io';
import 'package:event_follow/models/entities/event_datum.dart';
import 'package:event_follow/models/entities/event_meta.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;

final eventsRepositoryProvider = Provider.autoDispose
    .family<EventsRepository, dynamic>((ref, getOrGenerateIdToken) =>
        EventsRepository(getOrGenerateIdToken: getOrGenerateIdToken));

class EventsRepository {
  final getOrGenerateIdToken;

  EventsRepository({required this.getOrGenerateIdToken});

  Future<EventsApiResults> requestEventsApi(
      {required EventsApiRequest request}) async {
    final url = Uri.https(
        "event-follow-front.herokuapp.com", "/api/events", request.toParams());

    final response = await http.get(
      url,
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader:
            "Bearer ${await this.getOrGenerateIdToken()}"
      },
    );
    return EventsApiResults.fromJson(json.decode(response.body));
  }
}

class EventsApiRequest {
  final String pageId;
  final String sort;
  final String time;
  final String friends;

  EventsApiRequest({
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

class EventsApiResults {
  EventsApiResults({
    required this.meta,
    required this.data,
  });

  EventMeta meta;
  List<EventDatum> data;

  factory EventsApiResults.fromJson(Map<String, dynamic> json) =>
      EventsApiResults(
        meta: EventMeta.fromJson(json["meta"]),
        data: List<EventDatum>.from(
            json["data"].map((x) => EventDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "meta": meta.toJson(),
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}
