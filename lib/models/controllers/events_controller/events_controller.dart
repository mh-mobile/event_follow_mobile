import 'package:event_follow/config/sort_filter_globals.dart';
import 'package:event_follow/models/repositories/events/events_api_request.dart';
import 'package:event_follow/models/repositories/events/events_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'events_state.dart';

export 'events_state.dart';

const eventsTopScrollButtonVisiblePosition = 800.0;
const initialPageId = '1';

final eventsConditionProvider =
    StateProvider.autoDispose<SortFilterStateStore?>((ref) => null);

final eventsScrollPositionProvider =
    StateProvider.autoDispose<double>((ref) => 0.0);

final eventsTopScrollButtonVisibilityProvider = Provider.autoDispose<bool>(
    (ref) =>
        ref.watch(eventsScrollPositionProvider).state >
        eventsTopScrollButtonVisiblePosition);

final eventsProvider =
    StateNotifierProvider.autoDispose((ref) => EventsController(ref.read));

class EventsController extends StateNotifier<EventsState> {
  EventsController(this._read) : super(EventsState()) {
    state = state.copyWith(
      isLoading: false,
    );
    _eventsRepository = _read(eventsRepositoryProvider);

    request(EventsApiRequest(pageId: initialPageId));
  }

  final Reader _read;
  late final EventsRepository _eventsRepository;

  Future<void> request(EventsApiRequest request) async {
    state = state.copyWith(
      isLoading: true,
    );

    if (request.pageId == initialPageId) {
      clearData();
    }

    final eventsApiResults =
        await _eventsRepository.requestEventsApi(request: request);

    _read(eventsConditionProvider).state = SortFilterStateStore(
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
    _read(eventsScrollPositionProvider).state = 0.0;
  }
}
