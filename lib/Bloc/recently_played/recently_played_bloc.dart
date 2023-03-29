import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:musik/model/dbfunctions.dart';
import 'package:musik/model/recentlyPlayed.dart';

part 'recently_played_event.dart';
part 'recently_played_state.dart';
part 'recently_played_bloc.freezed.dart';

class RecentlyPlayedBloc
    extends Bloc<RecentlyPlayedEvent, RecentlyPlayedState> {
  RecentlyPlayedBloc() : super(RecentlyPlayedState.initial()) {
    on<_Started>((event, emit) => emit(RecentlyPlayedState(
        recent: recentlyplayedbox.values.toList().reversed.toList())));
  }
}
