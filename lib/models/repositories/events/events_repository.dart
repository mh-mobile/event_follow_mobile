import 'dart:convert';
import 'dart:io';
import 'package:event_follow/models/api.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'events_api_request.dart';
import 'events_api_response.dart';

final eventsRepositoryProvider = Provider.autoDispose
    .family<EventsRepository, dynamic>((ref, getOrGenerateIdToken) =>
        EventsRepository(getOrGenerateIdToken: getOrGenerateIdToken, read: ref.read));

class EventsRepository {
  final getOrGenerateIdToken;
  final Reader read;

  EventsRepository({required this.getOrGenerateIdToken, required this.read});

  Future<EventsApiResponse> requestEventsApi(
      {required EventsApiRequest request}) async {

    final apiClient = read(apiClientProvider);
    final response = await apiClient.request(request);
    return EventsApiResponse.fromJson(json.decode(response.body));
  }
}
