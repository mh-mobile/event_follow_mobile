import 'package:event_follow/models/controllers/users_controller/users_state.dart';

import '../../../main.dart';
import '../../models.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

export 'users_state.dart';

final usersProvider =
    StateNotifierProvider.autoDispose((ref) => UsersController(ref.read));

class UsersController extends StateNotifier<UsersState> {
  UsersController(this._read) : super(UsersState()) {
    state = state.copyWith(
      status: UsersStatus.NG,
      isLoading: false,
    );

    final getIdToken = firebaseAuth.currentUser?.getIdToken;
    _usersRepository = this._read(usersRepositoryProvider(getIdToken));
  }

  final Reader _read;
  late final UsersRepository _usersRepository;

  Future<void> requestAccountDeletion() async {
    final usersApiResults = await _usersRepository.requestAccountDeletion();
    state = state.copyWith(
      status: usersApiResults.status == "OK" ? UsersStatus.OK : UsersStatus.NG,
    );
  }

  void setLoading(bool isLoading) {
    state = state.copyWith(isLoading: isLoading);
  }
}