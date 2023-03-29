// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'most_played_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MostPlayedEvent {
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
abstract class $MostPlayedEventCopyWith<$Res> {
  factory $MostPlayedEventCopyWith(
          MostPlayedEvent value, $Res Function(MostPlayedEvent) then) =
      _$MostPlayedEventCopyWithImpl<$Res, MostPlayedEvent>;
}

/// @nodoc
class _$MostPlayedEventCopyWithImpl<$Res, $Val extends MostPlayedEvent>
    implements $MostPlayedEventCopyWith<$Res> {
  _$MostPlayedEventCopyWithImpl(this._value, this._then);

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
    extends _$MostPlayedEventCopyWithImpl<$Res, _$_Started>
    implements _$$_StartedCopyWith<$Res> {
  __$$_StartedCopyWithImpl(_$_Started _value, $Res Function(_$_Started) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Started implements _Started {
  const _$_Started();

  @override
  String toString() {
    return 'MostPlayedEvent.started()';
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

abstract class _Started implements MostPlayedEvent {
  const factory _Started() = _$_Started;
}

/// @nodoc
mixin _$MostPlayedState {
  List<MostPlayed> get songlist => throw _privateConstructorUsedError;
  List<Audio> get songs => throw _privateConstructorUsedError;
  List<MostPlayed> get finalmpsongs => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MostPlayedStateCopyWith<MostPlayedState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MostPlayedStateCopyWith<$Res> {
  factory $MostPlayedStateCopyWith(
          MostPlayedState value, $Res Function(MostPlayedState) then) =
      _$MostPlayedStateCopyWithImpl<$Res, MostPlayedState>;
  @useResult
  $Res call(
      {List<MostPlayed> songlist,
      List<Audio> songs,
      List<MostPlayed> finalmpsongs});
}

/// @nodoc
class _$MostPlayedStateCopyWithImpl<$Res, $Val extends MostPlayedState>
    implements $MostPlayedStateCopyWith<$Res> {
  _$MostPlayedStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? songlist = null,
    Object? songs = null,
    Object? finalmpsongs = null,
  }) {
    return _then(_value.copyWith(
      songlist: null == songlist
          ? _value.songlist
          : songlist // ignore: cast_nullable_to_non_nullable
              as List<MostPlayed>,
      songs: null == songs
          ? _value.songs
          : songs // ignore: cast_nullable_to_non_nullable
              as List<Audio>,
      finalmpsongs: null == finalmpsongs
          ? _value.finalmpsongs
          : finalmpsongs // ignore: cast_nullable_to_non_nullable
              as List<MostPlayed>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MostPlayedCopyWith<$Res>
    implements $MostPlayedStateCopyWith<$Res> {
  factory _$$_MostPlayedCopyWith(
          _$_MostPlayed value, $Res Function(_$_MostPlayed) then) =
      __$$_MostPlayedCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<MostPlayed> songlist,
      List<Audio> songs,
      List<MostPlayed> finalmpsongs});
}

/// @nodoc
class __$$_MostPlayedCopyWithImpl<$Res>
    extends _$MostPlayedStateCopyWithImpl<$Res, _$_MostPlayed>
    implements _$$_MostPlayedCopyWith<$Res> {
  __$$_MostPlayedCopyWithImpl(
      _$_MostPlayed _value, $Res Function(_$_MostPlayed) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? songlist = null,
    Object? songs = null,
    Object? finalmpsongs = null,
  }) {
    return _then(_$_MostPlayed(
      songlist: null == songlist
          ? _value._songlist
          : songlist // ignore: cast_nullable_to_non_nullable
              as List<MostPlayed>,
      songs: null == songs
          ? _value._songs
          : songs // ignore: cast_nullable_to_non_nullable
              as List<Audio>,
      finalmpsongs: null == finalmpsongs
          ? _value._finalmpsongs
          : finalmpsongs // ignore: cast_nullable_to_non_nullable
              as List<MostPlayed>,
    ));
  }
}

/// @nodoc

class _$_MostPlayed implements _MostPlayed {
  const _$_MostPlayed(
      {required final List<MostPlayed> songlist,
      required final List<Audio> songs,
      required final List<MostPlayed> finalmpsongs})
      : _songlist = songlist,
        _songs = songs,
        _finalmpsongs = finalmpsongs;

  final List<MostPlayed> _songlist;
  @override
  List<MostPlayed> get songlist {
    if (_songlist is EqualUnmodifiableListView) return _songlist;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_songlist);
  }

  final List<Audio> _songs;
  @override
  List<Audio> get songs {
    if (_songs is EqualUnmodifiableListView) return _songs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_songs);
  }

  final List<MostPlayed> _finalmpsongs;
  @override
  List<MostPlayed> get finalmpsongs {
    if (_finalmpsongs is EqualUnmodifiableListView) return _finalmpsongs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_finalmpsongs);
  }

  @override
  String toString() {
    return 'MostPlayedState(songlist: $songlist, songs: $songs, finalmpsongs: $finalmpsongs)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MostPlayed &&
            const DeepCollectionEquality().equals(other._songlist, _songlist) &&
            const DeepCollectionEquality().equals(other._songs, _songs) &&
            const DeepCollectionEquality()
                .equals(other._finalmpsongs, _finalmpsongs));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_songlist),
      const DeepCollectionEquality().hash(_songs),
      const DeepCollectionEquality().hash(_finalmpsongs));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MostPlayedCopyWith<_$_MostPlayed> get copyWith =>
      __$$_MostPlayedCopyWithImpl<_$_MostPlayed>(this, _$identity);
}

abstract class _MostPlayed implements MostPlayedState {
  const factory _MostPlayed(
      {required final List<MostPlayed> songlist,
      required final List<Audio> songs,
      required final List<MostPlayed> finalmpsongs}) = _$_MostPlayed;

  @override
  List<MostPlayed> get songlist;
  @override
  List<Audio> get songs;
  @override
  List<MostPlayed> get finalmpsongs;
  @override
  @JsonKey(ignore: true)
  _$$_MostPlayedCopyWith<_$_MostPlayed> get copyWith =>
      throw _privateConstructorUsedError;
}
