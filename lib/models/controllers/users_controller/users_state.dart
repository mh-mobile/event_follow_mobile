import 'package:freezed_annotation/freezed_annotation.dart';

part 'users_state.freezed.dart';

enum UsersStatus { OK, NG }

@freezed
abstract class UsersState with _$UsersState {
  factory UsersState({
    @Default(UsersStatus.NG) UsersStatus status,
    @Default(false) bool isLoading,
  }) = _UsersState;

  UsersState._();
}
