part of 'recently_played_bloc.dart';

@freezed
class RecentlyPlayedState with _$RecentlyPlayedState {
  const factory RecentlyPlayedState({required List<RecentlyPlayed> recent}) =
      _RecentPlayedState;
  factory RecentlyPlayedState.initial() =>
      RecentlyPlayedState(recent: recentlyplayedbox.values.toList());
}
