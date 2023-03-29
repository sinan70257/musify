part of 'recently_played_bloc.dart';

@freezed
class RecentlyPlayedEvent with _$RecentlyPlayedEvent {
  const factory RecentlyPlayedEvent.started() = _Started;
}