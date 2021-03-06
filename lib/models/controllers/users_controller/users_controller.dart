import 'package:event_follow/models/controllers/users_controller/users_state.dart';
import 'package:event_follow/models/repositories/users/account_deletion_api_request.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models.dart';

export 'users_state.dart';

final usersProvider =
    StateNotifierProvider.autoDispose((ref) => UsersController(ref.read));

class UsersController extends StateNotifier<UsersState> {
  UsersController(this._read) : super(UsersState()) {
    state = state.copyWith(
      status: UsersStatus.ng,
      isLoading: false,
    );

    _usersRepository = _read(usersRepositoryProvider);
  }

  final Reader _read;
  late final UsersRepository _usersRepository;

  Future<void> requestAccountDeletion() async {
    final usersApiResults = await _usersRepository
        .requestAccountDeletion(AccountDeletionApiRequest());
    state = state.copyWith(
      status: usersApiResults.status == 'OK' ? UsersStatus.ok : UsersStatus.ng,
    );
  }

  void setLoading({required bool isLoading}) {
    state = state.copyWith(isLoading: isLoading);
  }
}
