import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'sessions_state.freezed.dart';

enum SessionsStatus {
  OK,
  NG
}

@freezed
abstract class SessionsState with _$SessionsState {
  factory SessionsState({
    @Default(SessionsStatus.NG) SessionsStatus status,
    @Default(false) bool isLoading,
  }) = _SessionsState;

  SessionsState._();
}