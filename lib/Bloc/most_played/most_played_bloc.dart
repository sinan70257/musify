import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:musik/model/dbfunctions.dart';
import 'package:musik/model/mostPlayed.dart';
import 'package:musik/model/songModel.dart';
import 'package:musik/screens/mostplayed_screen/most_played.dart';

part 'most_played_event.dart';
part 'most_played_state.dart';
part 'most_played_bloc.freezed.dart';

class MostPlayedBloc extends Bloc<MostPlayedEvent, MostPlayedState> {
  MostPlayedBloc() : super(MostPlayedState.initial()) {
    // ignore: void_checks
    on<_Started>((event, emit) {
      List<Audio> songs1 = [];
      List<MostPlayed> finalmp = [];
      int i = 0;
      for (var item in state.songlist) {
        if (item.count > 5) {
          finalmp.insert(i, item);
        }
      }
      for (var items in finalmp) {
        songs1.add(Audio.file(items.songurl,
            metas: Metas(
                title: items.songname,
                artist: items.artist,
                id: items.id.toString())));
      }
      return MostPlayedState(
          songlist: mostplayedsongs.values.toList(),
          finalmpsongs: finalmp,
          songs: songs1);

      // TODO: implement event handler
    });
  }
}
