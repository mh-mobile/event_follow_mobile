import 'package:event_follow/config/sort_filter_globals.dart';
import 'package:event_follow/models/repositories/events/events_api_request.dart';
import 'package:event_follow/models/repositories/events/events_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'events_state.dart';

export 'events_state.dart';

final eventsConditionProvider =
    StateProvider.autoDispose<SortFilterStateStore?>((ref) => null);

final eventsProvider =
    StateNotifierProvider.autoDispose((ref) => EventsController(ref.read));

class EventsController extends StateNotifier<EventsState> {
  EventsController(this._read) : super(EventsState()) {
    state = state.copyWith(
      isLoading: false,
    );
    _eventsRepository = this._read(eventsRepositoryProvider);

    request(EventsApiRequest(pageId: "1"));
  }

  final Reader _read;
  late final EventsRepository _eventsRepository;

  Future<void> request(EventsApiRequest request) async {
    state = state.copyWith(
      isLoading: true,
    );

    if (request.pageId == "1") {
      clearData();
    }

    final eventsApiResults =
        await _eventsRepository.requestEventsApi(request: request);

    this._read(eventsConditionProvider).state = SortFilterStateStore(
      sortType: SortTypeExtension.convert(eventsApiResults.meta.eventSortType),
      timeFilterType:
          TimeFilterTypeExtension.convert(eventsApiResults.meta.timeFilterType),
      friendFilterType: FriendsFilterTypeExtension.convert(
          eventsApiResults.meta.friendsFilterType),
    );

    state = state.copyWith(
      data: [...state.data, ...eventsApiResults.data],
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
