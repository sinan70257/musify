// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'allsongs_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AllsongsEvent {
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
abstract class $AllsongsEventCopyWith<$Res> {
  factory $AllsongsEventCopyWith(
          AllsongsEvent value, $Res Function(AllsongsEvent) then) =
      _$AllsongsEventCopyWithImpl<$Res, AllsongsEvent>;
}

/// @nodoc
class _$AllsongsEventCopyWithImpl<$Res, $Val extends AllsongsEvent>
    implements $AllsongsEventCopyWith<$Res> {
  _$AllsongsEventCopyWithImpl(this._value, this._then);

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
    extends _$AllsongsEventCopyWithImpl<$Res, _$_Started>
    implements _$$_StartedCopyWith<$Res> {
  __$$_StartedCopyWithImpl(_$_Started _value, $Res Function(_$_Started) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Started implements _Started {
  const _$_Started();

  @override
  String toString() {
    return 'AllsongsEvent.started()';
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

abstract class _Started implements AllsongsEvent {
  const factory _Started() = _$_Started;
}

/// @nodoc
mixin _$AllsongsState {
  List<Songs> get alldbsongs => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AllsongsStateCopyWith<AllsongsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AllsongsStateCopyWith<$Res> {
  factory $AllsongsStateCopyWith(
          AllsongsState value, $Res Function(AllsongsState) then) =
      _$AllsongsStateCopyWithImpl<$Res, AllsongsState>;
  @useResult
  $Res call({List<Songs> alldbsongs});
}

/// @nodoc
class _$AllsongsStateCopyWithImpl<$Res, $Val extends AllsongsState>
    implements $AllsongsStateCopyWith<$Res> {
  _$AllsongsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? alldbsongs = null,
  }) {
    return _then(_value.copyWith(
      alldbsongs: null == alldbsongs
          ? _value.alldbsongs
          : alldbsongs // ignore: cast_nullable_to_non_nullable
              as List<Songs>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AllsongsStateCopyWith<$Res>
    implements $AllsongsStateCopyWith<$Res> {
  factory _$$_AllsongsStateCopyWith(
          _$_AllsongsState value, $Res Function(_$_AllsongsState) then) =
      __$$_AllsongsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Songs> alldbsongs});
}

/// @nodoc
class __$$_AllsongsStateCopyWithImpl<$Res>
    extends _$AllsongsStateCopyWithImpl<$Res, _$_AllsongsState>
    implements _$$_AllsongsStateCopyWith<$Res> {
  __$$_AllsongsStateCopyWithImpl(
      _$_AllsongsState _value, $Res Function(_$_AllsongsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? alldbsongs = null,
  }) {
    return _then(_$_AllsongsState(
      alldbsongs: null == alldbsongs
          ? _value._alldbsongs
          : alldbsongs // ignore: cast_nullable_to_non_nullable
              as List<Songs>,
    ));
  }
}

/// @nodoc

class _$_AllsongsState implements _AllsongsState {
  const _$_AllsongsState({required final List<Songs> alldbsongs})
      : _alldbsongs = alldbsongs;

  final List<Songs> _alldbsongs;
  @override
  List<Songs> get alldbsongs {
    if (_alldbsongs is EqualUnmodifiableListView) return _alldbsongs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_alldbsongs);
  }

  @override
  String toString() {
    return 'AllsongsState(alldbsongs: $alldbsongs)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AllsongsState &&
            const DeepCollectionEquality()
                .equals(other._alldbsongs, _alldbsongs));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_alldbsongs));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AllsongsStateCopyWith<_$_AllsongsState> get copyWith =>
      __$$_AllsongsStateCopyWithImpl<_$_AllsongsState>(this, _$identity);
}

abstract class _AllsongsState implements AllsongsState {
  const factory _AllsongsState({required final List<Songs> alldbsongs}) =
      _$_AllsongsState;

  @override
  List<Songs> get alldbsongs;
  @override
  @JsonKey(ignore: true)
  _$$_AllsongsStateCopyWith<_$_AllsongsState> get copyWith =>
      throw _privateConstructorUsedError;
}
