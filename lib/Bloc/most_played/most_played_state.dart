part of 'most_played_bloc.dart';

@freezed
class MostPlayedState with _$MostPlayedState {
  const factory MostPlayedState(
      {required List<MostPlayed> songlist,
      required List<Audio> songs,
      required List<MostPlayed> finalmpsongs}) = _MostPlayed;
  factory MostPlayedState.initial() => MostPlayedState(
      songlist: mostplayedsongs.values.toList(), finalmpsongs: [], songs: []);
}
