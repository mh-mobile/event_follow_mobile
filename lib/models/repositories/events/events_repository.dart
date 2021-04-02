import 'dart:convert';
import 'dart:io';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;
import 'events_api_request.dart';
import 'events_api_response.dart';

final eventsRepositoryProvider = Provider.autoDispose
    .family<EventsRepository, dynamic>((ref, getOrGenerateIdToken) =>
        EventsRepository(getOrGenerateIdToken: getOrGenerateIdToken));

class EventsRepository {
  final getOrGenerateIdToken;

  EventsRepository({required this.getOrGenerateIdToken});

  Future<EventsApiResponse> requestEventsApi(
      {required EventsApiRequest request}) async {
    final url = Uri.https(
        "event-follow-front.herokuapp.com", request.getApiPath, request.toParams());

    final response = await http.get(
      url,
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader:
            "Bearer ${await this.getOrGenerateIdToken()}"
      },
    );
    return EventsApiResponse.fromJson(json.decode(response.body));
  }
}
