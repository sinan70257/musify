part of 'now_playing_bloc.dart';

@freezed
class NowPlayingEvent with _$NowPlayingEvent {
  const factory NowPlayingEvent.tapped() = _Tapped;
  const factory NowPlayingEvent.untapped() = _Untapped;
  const factory NowPlayingEvent.ontaped() = _Ontaped;
  const factory NowPlayingEvent.untap() = _Untap;
  const factory NowPlayingEvent.name() = _Name;
}
