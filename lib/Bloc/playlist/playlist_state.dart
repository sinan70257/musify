part of 'playlist_bloc.dart';

@freezed
class PlaylistState with _$PlaylistState {
  const factory PlaylistState({required List<PlaylistSongs> playlist}) =
      _PlaylistState;
  factory PlaylistState.initial() =>
      PlaylistState(playlist: playlistbox.values.toList());
}
