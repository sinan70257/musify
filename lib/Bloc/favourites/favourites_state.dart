part of 'favourites_bloc.dart';

@freezed
class FavouritesState with _$FavouritesState {
  const factory FavouritesState({required List<favsongs> fav}) =
      _FavouritesState;

  factory FavouritesState.initial() =>
      FavouritesState(fav: favsongsdb.values.toList());
}
