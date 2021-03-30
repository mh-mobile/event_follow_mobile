// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'sessions_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SessionsStateTearOff {
  const _$SessionsStateTearOff();

  _SessionsState call(
      {SessionsStatus status = SessionsStatus.NG, bool isLoading = true}) {
    return _SessionsState(
      status: status,
      isLoading: isLoading,
    );
  }
}

/// @nodoc
const $SessionsState = _$SessionsStateTearOff();

/// @nodoc
mixin _$SessionsState {
  SessionsStatus get status => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SessionsStateCopyWith<SessionsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionsStateCopyWith<$Res> {
  factory $SessionsStateCopyWith(
          SessionsState value, $Res Function(SessionsState) then) =
      _$SessionsStateCopyWithImpl<$Res>;
  $Res call({SessionsStatus status, bool isLoading});
}

/// @nodoc
class _$SessionsStateCopyWithImpl<$Res>
    implements $SessionsStateCopyWith<$Res> {
  _$SessionsStateCopyWithImpl(this._value, this._then);

  final SessionsState _value;
  // ignore: unused_field
  final $Res Function(SessionsState) _then;

  @override
  $Res call({
    Object? status = freezed,
    Object? isLoading = freezed,
  }) {
    return _then(_value.copyWith(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SessionsStatus,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$SessionsStateCopyWith<$Res>
    implements $SessionsStateCopyWith<$Res> {
  factory _$SessionsStateCopyWith(
          _SessionsState value, $Res Function(_SessionsState) then) =
      __$SessionsStateCopyWithImpl<$Res>;
  @override
  $Res call({SessionsStatus status, bool isLoading});
}

/// @nodoc
class __$SessionsStateCopyWithImpl<$Res>
    extends _$SessionsStateCopyWithImpl<$Res>
    implements _$SessionsStateCopyWith<$Res> {
  __$SessionsStateCopyWithImpl(
      _SessionsState _value, $Res Function(_SessionsState) _then)
      : super(_value, (v) => _then(v as _SessionsState));

  @override
  _SessionsState get _value => super._value as _SessionsState;

  @override
  $Res call({
    Object? status = freezed,
    Object? isLoading = freezed,
  }) {
    return _then(_SessionsState(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SessionsStatus,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
class _$_SessionsState extends _SessionsState with DiagnosticableTreeMixin {
  _$_SessionsState({this.status = SessionsStatus.NG, this.isLoading = true})
      : super._();

  @JsonKey(defaultValue: SessionsStatus.NG)
  @override
  final SessionsStatus status;
  @JsonKey(defaultValue: true)
  @override
  final bool isLoading;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SessionsState(status: $status, isLoading: $isLoading)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SessionsState'))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('isLoading', isLoading));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SessionsState &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.isLoading, isLoading) ||
                const DeepCollectionEquality()
                    .equals(other.isLoading, isLoading)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(isLoading);

  @JsonKey(ignore: true)
  @override
  _$SessionsStateCopyWith<_SessionsState> get copyWith =>
      __$SessionsStateCopyWithImpl<_SessionsState>(this, _$identity);
}

abstract class _SessionsState extends SessionsState {
  factory _SessionsState({SessionsStatus status, bool isLoading}) =
      _$_SessionsState;
  _SessionsState._() : super._();

  @override
  SessionsStatus get status => throw _privateConstructorUsedError;
  @override
  bool get isLoading => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SessionsStateCopyWith<_SessionsState> get copyWith =>
      throw _privateConstructorUsedError;
}
