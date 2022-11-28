import 'package:hive/hive.dart';
import 'package:musik/model/favouriteModel.dart';
import 'package:musik/model/playlistmodel.dart';

late Box<favsongs> favsongsdb;
opendb_fav() async {
  favsongsdb = await Hive.openBox<favsongs>('favsongs');
}

late Box<PlaylistSongs> playlistbox;
opendatabase() async {
  playlistbox = await Hive.openBox<PlaylistSongs>('playlist');
}
