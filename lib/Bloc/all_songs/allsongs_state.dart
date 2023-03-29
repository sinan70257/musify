part of 'allsongs_bloc.dart';

@freezed
class AllsongsState with _$AllsongsState {
  const factory AllsongsState({required List<Songs> alldbsongs}) =
      _AllsongsState;
  factory AllsongsState.initial() =>
      AllsongsState(alldbsongs: SongBox.getInstance().values.toList());
}
