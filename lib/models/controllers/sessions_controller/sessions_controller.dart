import 'package:event_follow/models/controllers/sessions_controller/sessions_state.dart';
import 'package:event_follow/models/repositories/sessions/sessions_api_request.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models.dart';

export 'sessions_state.dart';

final sessionsProvider =
    StateNotifierProvider.autoDispose((ref) => SessionsController(ref.read));

class SessionsController extends StateNotifier<SessionsState> {
  SessionsController(this._read) : super(SessionsState()) {
    state = state.copyWith(
      status: SessionsStatus.none,
      isLoading: false,
    );

    _sessionsRepository = _read(sessionsRepositoryProvider);
  }

  final Reader _read;
  late final SessionsRepository _sessionsRepository;

  Future<void> request(SessionsApiRequest request) async {
    state = state.copyWith(
      status: SessionsStatus.none,
    );

    try {
      final sessionApiResults =
          await _sessionsRepository.requestSessionsApi(request: request);
      state = state.copyWith(
        status: sessionApiResults.status == 'OK'
            ? SessionsStatus.ok
            : SessionsStatus.ng,
      );
    } on Exception {
      state = state.copyWith(
        isLoading: false,
        status: SessionsStatus.ng,
      );
    }
  }

  void setLoading({required bool isLoading}) {
    state = state.copyWith(isLoading: isLoading);
  }
}
