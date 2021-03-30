import 'package:event_follow/models/entities/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'friendships_state.freezed.dart';

@freezed
abstract class FriendshipsState with _$FriendshipsState {
  factory FriendshipsState({
    @Default(<int, List<User>>{}) Map<int, List<User>> friendsData,
    @Default(<int, bool>{}) Map<int, bool> loadingData,
  }) = _FriendshipsState;

  FriendshipsState._();
}
