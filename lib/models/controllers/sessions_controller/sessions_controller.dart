import 'package:event_follow/models/repositories/sessions/sessions_api_request.dart';
import '../../models.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

export 'sessions_state.dart';

final sessionsProvider = StateNotifierProvider.autoDispose((ref) => SessionsController(ref.read));

class SessionsController extends StateNotifier<SessionsState> {
  SessionsController(this._read): super(SessionsState()) {
    state = state.copyWith(
      status: SessionsStatus.NG,
      isLoading: false,
    );

    _sessionsRepository = this._read(sessionsRepositoryProvider);

  }

  final Reader _read;
  late final SessionsRepository _sessionsRepository;

  Future<void> request(SessionsApiRequest request) async {

    final sessionApiResults =
    await _sessionsRepository.requestSessionsApi(request: request);
    state = state.copyWith(
      status: sessionApiResults.status == "OK" ? SessionsStatus.OK : SessionsStatus.NG,
    );
  }

  void setLoading(bool isLoading) {
    state = state.copyWith(
      isLoading: isLoading
    );
  }

}
