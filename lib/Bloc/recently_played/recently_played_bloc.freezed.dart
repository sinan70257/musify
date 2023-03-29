// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recently_played_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RecentlyPlayedEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecentlyPlayedEventCopyWith<$Res> {
  factory $RecentlyPlayedEventCopyWith(
          RecentlyPlayedEvent value, $Res Function(RecentlyPlayedEvent) then) =
      _$RecentlyPlayedEventCopyWithImpl<$Res, RecentlyPlayedEvent>;
}

/// @nodoc
class _$RecentlyPlayedEventCopyWithImpl<$Res, $Val extends RecentlyPlayedEvent>
    implements $RecentlyPlayedEventCopyWith<$Res> {
  _$RecentlyPlayedEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_StartedCopyWith<$Res> {
  factory _$$_StartedCopyWith(
          _$_Started value, $Res Function(_$_Started) then) =
      __$$_StartedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_StartedCopyWithImpl<$Res>
    extends _$RecentlyPlayedEventCopyWithImpl<$Res, _$_Started>
    implements _$$_StartedCopyWith<$Res> {
  __$$_StartedCopyWithImpl(_$_Started _value, $Res Function(_$_Started) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Started implements _Started {
  const _$_Started();

  @override
  String toString() {
    return 'RecentlyPlayedEvent.started()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Started);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements RecentlyPlayedEvent {
  const factory _Started() = _$_Started;
}

/// @nodoc
mixin _$RecentlyPlayedState {
  List<RecentlyPlayed> get recent => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RecentlyPlayedStateCopyWith<RecentlyPlayedState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecentlyPlayedStateCopyWith<$Res> {
  factory $RecentlyPlayedStateCopyWith(
          RecentlyPlayedState value, $Res Function(RecentlyPlayedState) then) =
      _$RecentlyPlayedStateCopyWithImpl<$Res, RecentlyPlayedState>;
  @useResult
  $Res call({List<RecentlyPlayed> recent});
}

/// @nodoc
class _$RecentlyPlayedStateCopyWithImpl<$Res, $Val extends RecentlyPlayedState>
    implements $RecentlyPlayedStateCopyWith<$Res> {
  _$RecentlyPlayedStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recent = null,
  }) {
    return _then(_value.copyWith(
      recent: null == recent
          ? _value.recent
          : recent // ignore: cast_nullable_to_non_nullable
              as List<RecentlyPlayed>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RecentPlayedStateCopyWith<$Res>
    implements $RecentlyPlayedStateCopyWith<$Res> {
  factory _$$_RecentPlayedStateCopyWith(_$_RecentPlayedState value,
          $Res Function(_$_RecentPlayedState) then) =
      __$$_RecentPlayedStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<RecentlyPlayed> recent});
}

/// @nodoc
class __$$_RecentPlayedStateCopyWithImpl<$Res>
    extends _$RecentlyPlayedStateCopyWithImpl<$Res, _$_RecentPlayedState>
    implements _$$_RecentPlayedStateCopyWith<$Res> {
  __$$_RecentPlayedStateCopyWithImpl(
      _$_RecentPlayedState _value, $Res Function(_$_RecentPlayedState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recent = null,
  }) {
    return _then(_$_RecentPlayedState(
      recent: null == recent
          ? _value._recent
          : recent // ignore: cast_nullable_to_non_nullable
              as List<RecentlyPlayed>,
    ));
  }
}

/// @nodoc

class _$_RecentPlayedState implements _RecentPlayedState {
  const _$_RecentPlayedState({required final List<RecentlyPlayed> recent})
      : _recent = recent;

  final List<RecentlyPlayed> _recent;
  @override
  List<RecentlyPlayed> get recent {
    if (_recent is EqualUnmodifiableListView) return _recent;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recent);
  }

  @override
  String toString() {
    return 'RecentlyPlayedState(recent: $recent)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RecentPlayedState &&
            const DeepCollectionEquality().equals(other._recent, _recent));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_recent));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RecentPlayedStateCopyWith<_$_RecentPlayedState> get copyWith =>
      __$$_RecentPlayedStateCopyWithImpl<_$_RecentPlayedState>(
          this, _$identity);
}

abstract class _RecentPlayedState implements RecentlyPlayedState {
  const factory _RecentPlayedState(
      {required final List<RecentlyPlayed> recent}) = _$_RecentPlayedState;

  @override
  List<RecentlyPlayed> get recent;
  @override
  @JsonKey(ignore: true)
  _$$_RecentPlayedStateCopyWith<_$_RecentPlayedState> get copyWith =>
      throw _privateConstructorUsedError;
}
