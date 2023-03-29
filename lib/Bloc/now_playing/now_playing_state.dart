part of 'now_playing_bloc.dart';

@freezed
class NowPlayingState with _$NowPlayingState {
  const factory NowPlayingState({
    required Color loop,
    required Color shuffle,
  }) = _NowPlayingState;
  factory NowPlayingState.initial() =>
      NowPlayingState(loop: Colors.white, shuffle: Colors.white);
}
