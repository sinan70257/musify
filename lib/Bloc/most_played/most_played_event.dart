part of 'most_played_bloc.dart';

@freezed
class MostPlayedEvent with _$MostPlayedEvent {
  const factory MostPlayedEvent.started() = _Started;
}