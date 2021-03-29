import 'package:event_follow/models/controllers/sessions_controller/sessions_state.dart';
import 'package:event_follow/pages/home_pages/home_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final sessionsProvider = StateNotifierProvider((ref) => SessionsController(ref.read));

class SessionsController extends StateNotifier<SessionsState> {
  SessionsController(this._read): super(SessionsState());

  final Reader _read;

  void request(SessionApiRequest request) {
    state = state.copyWith(status: SessionsStatus.OK);
  }
}