import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:musik/model/songModel.dart';
import 'package:musik/screens/search_screen/search_screen.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:on_audio_query/on_audio_query.dart';

class SearchController extends GetxController {
  OnAudioQuery fetchgalbum = OnAudioQuery();
  List<Songs> another = List.from(SdbSongs);
  List<AlbumModel> albumList = [];
  getSearch(String value) {
    another = SdbSongs.where((element) =>
        element.songname!.toLowerCase().contains(value.toLowerCase())).toList();
    SallSongs.clear();
    for (var item in another) {
      SallSongs.add(
        Audio.file(
          item.songurl.toString(),
          metas: Metas(
            artist: item.artist,
            title: item.songname,
            id: item.id.toString(),
          ),
        ),
      );
    }
    update();
  }

  getAlbum() async {
    albumList = await fetchgalbum.queryAlbums();

    for (var items in albumList) {
      albumList.add(items);
    }
    update();
  }
}
