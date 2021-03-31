// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'events_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$EventsStateTearOff {
  const _$EventsStateTearOff();

  _EventsState call(
      {List<EventDatum> data = const <EventDatum>[],
      EventMeta? meta = null,
      bool isLoading = false}) {
    return _EventsState(
      data: data,
      meta: meta,
      isLoading: isLoading,
    );
  }
}

/// @nodoc
const $EventsState = _$EventsStateTearOff();

/// @nodoc
mixin _$EventsState {
  List<EventDatum> get data => throw _privateConstructorUsedError;
  EventMeta? get meta => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EventsStateCopyWith<EventsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventsStateCopyWith<$Res> {
  factory $EventsStateCopyWith(
          EventsState value, $Res Function(EventsState) then) =
      _$EventsStateCopyWithImpl<$Res>;
  $Res call({List<EventDatum> data, EventMeta? meta, bool isLoading});

  $EventMetaCopyWith<$Res>? get meta;
}

/// @nodoc
class _$EventsStateCopyWithImpl<$Res> implements $EventsStateCopyWith<$Res> {
  _$EventsStateCopyWithImpl(this._value, this._then);

  final EventsState _value;
  // ignore: unused_field
  final $Res Function(EventsState) _then;

  @override
  $Res call({
    Object? data = freezed,
    Object? meta = freezed,
    Object? isLoading = freezed,
  }) {
    return _then(_value.copyWith(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<EventDatum>,
      meta: meta == freezed
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as EventMeta?,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  $EventMetaCopyWith<$Res>? get meta {
    if (_value.meta == null) {
      return null;
    }

    return $EventMetaCopyWith<$Res>(_value.meta!, (value) {
      return _then(_value.copyWith(meta: value));
    });
  }
}

/// @nodoc
abstract class _$EventsStateCopyWith<$Res>
    implements $EventsStateCopyWith<$Res> {
  factory _$EventsStateCopyWith(
          _EventsState value, $Res Function(_EventsState) then) =
      __$EventsStateCopyWithImpl<$Res>;
  @override
  $Res call({List<EventDatum> data, EventMeta? meta, bool isLoading});

  @override
  $EventMetaCopyWith<$Res>? get meta;
}

/// @nodoc
class __$EventsStateCopyWithImpl<$Res> extends _$EventsStateCopyWithImpl<$Res>
    implements _$EventsStateCopyWith<$Res> {
  __$EventsStateCopyWithImpl(
      _EventsState _value, $Res Function(_EventsState) _then)
      : super(_value, (v) => _then(v as _EventsState));

  @override
  _EventsState get _value => super._value as _EventsState;

  @override
  $Res call({
    Object? data = freezed,
    Object? meta = freezed,
    Object? isLoading = freezed,
  }) {
    return _then(_EventsState(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<EventDatum>,
      meta: meta == freezed
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as EventMeta?,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
class _$_EventsState extends _EventsState {
  _$_EventsState(
      {this.data = const <EventDatum>[],
      this.meta = null,
      this.isLoading = false})
      : super._();

  @JsonKey(defaultValue: const <EventDatum>[])
  @override
  final List<EventDatum> data;
  @JsonKey(defaultValue: null)
  @override
  final EventMeta? meta;
  @JsonKey(defaultValue: false)
  @override
  final bool isLoading;

  @override
  String toString() {
    return 'EventsState(data: $data, meta: $meta, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _EventsState &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)) &&
            (identical(other.meta, meta) ||
                const DeepCollectionEquality().equals(other.meta, meta)) &&
            (identical(other.isLoading, isLoading) ||
                const DeepCollectionEquality()
                    .equals(other.isLoading, isLoading)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(data) ^
      const DeepCollectionEquality().hash(meta) ^
      const DeepCollectionEquality().hash(isLoading);

  @JsonKey(ignore: true)
  @override
  _$EventsStateCopyWith<_EventsState> get copyWith =>
      __$EventsStateCopyWithImpl<_EventsState>(this, _$identity);
}

abstract class _EventsState extends EventsState {
  factory _EventsState(
      {List<EventDatum> data,
      EventMeta? meta,
      bool isLoading}) = _$_EventsState;
  _EventsState._() : super._();

  @override
  List<EventDatum> get data => throw _privateConstructorUsedError;
  @override
  EventMeta? get meta => throw _privateConstructorUsedError;
  @override
  bool get isLoading => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$EventsStateCopyWith<_EventsState> get copyWith =>
      throw _privateConstructorUsedError;
}
