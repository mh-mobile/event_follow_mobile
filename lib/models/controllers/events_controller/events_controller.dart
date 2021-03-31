import 'package:event_follow/models/repositories/events/events_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../main.dart';
import 'events_state.dart';

export 'events_state.dart';

final eventsProvider =
    StateNotifierProvider.autoDispose((ref) => EventsController(ref.read));

class EventsController extends StateNotifier<EventsState> {
  EventsController(this._read) : super(EventsState()) {

    state = state.copyWith(
      isLoading: false,
    );
    final getIdToken = firebaseAuth.currentUser?.getIdToken;
    _eventsRepository = this._read(eventsRepositoryProvider(getIdToken));

    print("EventsController initaaa");
    request(EventsApiRequest(
        pageId: "1",
        sort: "friends_number_order",
        time: "past_8_hours",
        friends: "one_or_more_friends"));

  }

  final Reader _read;
  late final EventsRepository _eventsRepository;

  Future<void> request(EventsApiRequest request) async {
    state = state.copyWith(
      isLoading: true,
    );
    final eventsApiResults =
        await _eventsRepository.requestEventsApi(request: request);
    state = state.copyWith(
      data: eventsApiResults.data,
      meta: eventsApiResults.meta,
      isLoading: false,
    );
  }

  void clearData() {
    state = state.copyWith(
      data: [],
    );
  }
}
