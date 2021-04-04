import 'dart:convert';

import 'package:event_follow/models/api.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'events_api_request.dart';
import 'events_api_response.dart';

final eventsRepositoryProvider = Provider.autoDispose<EventsRepository>(
    (ref) => EventsRepository(read: ref.read));

class EventsRepository {
  EventsRepository({required this.read});

  final Reader read;
  Future<EventsApiResponse> requestEventsApi(
      {required EventsApiRequest request}) async {
    final apiClient = read(apiClientProvider);
    final response = await apiClient.request(request);
    return EventsApiResponse.fromJson(json.decode(response.body));
  }
}
