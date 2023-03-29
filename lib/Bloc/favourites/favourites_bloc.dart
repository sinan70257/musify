import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:musik/model/dbfunctions.dart';
import 'package:musik/model/favouriteModel.dart';

part 'favourites_event.dart';
part 'favourites_state.dart';
part 'favourites_bloc.freezed.dart';

class FavouritesBloc extends Bloc<FavouritesEvent, FavouritesState> {
  FavouritesBloc() : super(FavouritesState.initial()) {
    on<FavouritesEvent>((event, emit) {
      log(favsongsdb.length.toString());
      FavouritesState(fav: favsongsdb.values.toList());
      // TODO: implement event handler
    });
  }
}
