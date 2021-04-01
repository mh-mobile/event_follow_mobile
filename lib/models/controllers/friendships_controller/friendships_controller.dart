import 'package:event_follow/models/repositories/friendships/friendships_api_request.dart';
import 'package:synchronized/synchronized.dart';
import '../../../main.dart';
import '../../models.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'friendships_state.dart';

final friendshipsProvider =
StateNotifierProvider.autoDispose((ref) => FriendshipsController(ref.read));

class FriendshipsController extends StateNotifier<FriendshipsState> {
  FriendshipsController(this._read) : super(FriendshipsState()) {
    final getIdToken = firebaseAuth.currentUser?.getIdToken;
    _friendshipsRepository = this._read(friendshipsRepositoryProvider(getIdToken));
  }

  final Reader _read;
  late final FriendshipsRepository _friendshipsRepository;

  Future<void> requestFriendships(FriendshipsApiRequest request, int eventId) async {
    final friendshipApiResults = await _friendshipsRepository.requestFriendshipsApi(request: request);

    var lock = Lock();
    await lock.synchronized(() async {
      var friendsData = {...state.friendsData};
      friendsData[eventId] = friendshipApiResults.friends;
      state = state.copyWith(
        friendsData: friendsData,
      );
    });
  }

}
