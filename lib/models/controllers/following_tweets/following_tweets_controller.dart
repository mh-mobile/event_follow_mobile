import '../../../main.dart';
import '../../models.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'following_tweets_state.dart';

export 'following_tweets_state.dart';

final followingTweetsProvider = StateNotifierProvider.autoDispose((ref) => FollowingTweetsController(ref.read));

class FollowingTweetsController extends StateNotifier<FollowingTweetsState> {
  FollowingTweetsController(this._read): super(FollowingTweetsState()) {
    state = state.copyWith(
      isLoading: false,
    );
    final getIdToken = firebaseAuth.currentUser?.getIdToken;
    _followingTweetsRepository = this._read(followingTweetsRepositoryProvider(getIdToken));
  }

  final Reader _read;
  late final FollowingTweetsRepository _followingTweetsRepository;

  Future<void> request(FollowingTweetsApiRequest request) async {
    state = state.copyWith(
      tweets: [],
      isLoading: true,
    );
    final followingTweetsApiResults =
    await _followingTweetsRepository.requestFollowingTweetsApi(request: request);
    state = state.copyWith(
      tweets: followingTweetsApiResults.tweets,
      isLoading: false,
    );
  }

  void setLoading(bool isLoading) {
    state = state.copyWith(
      isLoading: isLoading
    );
  }

}
