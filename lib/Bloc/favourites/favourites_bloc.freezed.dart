// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favourites_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FavouritesEvent {
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
abstract class $FavouritesEventCopyWith<$Res> {
  factory $FavouritesEventCopyWith(
          FavouritesEvent value, $Res Function(FavouritesEvent) then) =
      _$FavouritesEventCopyWithImpl<$Res, FavouritesEvent>;
}

/// @nodoc
class _$FavouritesEventCopyWithImpl<$Res, $Val extends FavouritesEvent>
    implements $FavouritesEventCopyWith<$Res> {
  _$FavouritesEventCopyWithImpl(this._value, this._then);

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
    extends _$FavouritesEventCopyWithImpl<$Res, _$_Started>
    implements _$$_StartedCopyWith<$Res> {
  __$$_StartedCopyWithImpl(_$_Started _value, $Res Function(_$_Started) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Started implements _Started {
  const _$_Started();

  @override
  String toString() {
    return 'FavouritesEvent.started()';
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

abstract class _Started implements FavouritesEvent {
  const factory _Started() = _$_Started;
}

/// @nodoc
mixin _$FavouritesState {
  List<favsongs> get fav => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FavouritesStateCopyWith<FavouritesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavouritesStateCopyWith<$Res> {
  factory $FavouritesStateCopyWith(
          FavouritesState value, $Res Function(FavouritesState) then) =
      _$FavouritesStateCopyWithImpl<$Res, FavouritesState>;
  @useResult
  $Res call({List<favsongs> fav});
}

/// @nodoc
class _$FavouritesStateCopyWithImpl<$Res, $Val extends FavouritesState>
    implements $FavouritesStateCopyWith<$Res> {
  _$FavouritesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fav = null,
  }) {
    return _then(_value.copyWith(
      fav: null == fav
          ? _value.fav
          : fav // ignore: cast_nullable_to_non_nullable
              as List<favsongs>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FavouritesStateCopyWith<$Res>
    implements $FavouritesStateCopyWith<$Res> {
  factory _$$_FavouritesStateCopyWith(
          _$_FavouritesState value, $Res Function(_$_FavouritesState) then) =
      __$$_FavouritesStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<favsongs> fav});
}

/// @nodoc
class __$$_FavouritesStateCopyWithImpl<$Res>
    extends _$FavouritesStateCopyWithImpl<$Res, _$_FavouritesState>
    implements _$$_FavouritesStateCopyWith<$Res> {
  __$$_FavouritesStateCopyWithImpl(
      _$_FavouritesState _value, $Res Function(_$_FavouritesState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fav = null,
  }) {
    return _then(_$_FavouritesState(
      fav: null == fav
          ? _value._fav
          : fav // ignore: cast_nullable_to_non_nullable
              as List<favsongs>,
    ));
  }
}

/// @nodoc

class _$_FavouritesState implements _FavouritesState {
  const _$_FavouritesState({required final List<favsongs> fav}) : _fav = fav;

  final List<favsongs> _fav;
  @override
  List<favsongs> get fav {
    if (_fav is EqualUnmodifiableListView) return _fav;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_fav);
  }

  @override
  String toString() {
    return 'FavouritesState(fav: $fav)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FavouritesState &&
            const DeepCollectionEquality().equals(other._fav, _fav));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_fav));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FavouritesStateCopyWith<_$_FavouritesState> get copyWith =>
      __$$_FavouritesStateCopyWithImpl<_$_FavouritesState>(this, _$identity);
}

abstract class _FavouritesState implements FavouritesState {
  const factory _FavouritesState({required final List<favsongs> fav}) =
      _$_FavouritesState;

  @override
  List<favsongs> get fav;
  @override
  @JsonKey(ignore: true)
  _$$_FavouritesStateCopyWith<_$_FavouritesState> get copyWith =>
      throw _privateConstructorUsedError;
}
