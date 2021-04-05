import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sessions_state.freezed.dart';

enum SessionsStatus {
  none,
  ok,
  ng,
}

@freezed
abstract class SessionsState with _$SessionsState {
  factory SessionsState({
    @Default(SessionsStatus.none) SessionsStatus status,
    @Default(false) bool isLoading,
  }) = _SessionsState;

  SessionsState._();
}
