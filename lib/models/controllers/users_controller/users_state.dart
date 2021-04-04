import 'package:freezed_annotation/freezed_annotation.dart';

part 'users_state.freezed.dart';

enum UsersStatus { ok, ng }

@freezed
abstract class UsersState with _$UsersState {
  factory UsersState({
    @Default(UsersStatus.ng) UsersStatus status,
    @Default(false) bool isLoading,
  }) = _UsersState;

  UsersState._();
}
