import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:musik/Bloc/all_songs/allsongs_bloc.dart';
import 'package:musik/colors/colors.dart';
import 'package:musik/model/dbfunctions.dart';
import 'package:musik/model/mostPlayed.dart';
import 'package:musik/model/recentlyPlayed.dart';
import 'package:musik/model/songModel.dart';
import 'package:musik/screens/nowplaying_screen/now_playing.dart';

import 'package:musik/screens/favourite_screen/widgets/addTofavourite.dart';
import 'package:musik/screens/playlist_screen/widgets/addToPlaylist.dart';
import 'package:on_audio_query/on_audio_query.dart';

class allSongsScreen extends StatelessWidget {
  allSongsScreen({super.key});

  late bool isplaying;
  late bool playerVisibility;

  final box = SongBox.getInstance();
  List<Audio> convertAudios = [];
  final AssetsAudioPlayer _audioPlayer = AssetsAudioPlayer.withId('0');

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllsongsBloc, AllsongsState>(builder: (context, state) {
      List<MostPlayed> allmostplayedsongs = mostplayedsongs.values.toList();
      if (state.alldbsongs.isEmpty) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state.alldbsongs == null) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      return ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: state.alldbsongs.length,
          itemBuilder: (context, index) {
            bool fav = true;
            Songs songs = state.alldbsongs[index];
            MostPlayed MPsongs = allmostplayedsongs[index];
            // MostPlayed MPsongs = allmostplayedsongs[index];
            RecentlyPlayed rsongs;
            return Padding(
              padding: const EdgeInsets.fromLTRB(0, 5, 0, 2),
              child: ListTile(
                onTap: (() {
                  playerOnTap();
                  rsongs = RecentlyPlayed(
                      songname: songs.songname,
                      id: songs.id,
                      artist: songs.artist,
                      duration: songs.duration,
                      songurl: songs.songurl);

                  updateRecentPlayed(rsongs, index);

                  updatePlayedSongsCount(MPsongs, index);
                  // updatePlayedSongsCount(MPsongs, index);
                  _audioPlayer.open(
                      Playlist(audios: convertAudios, startIndex: index),
                      showNotification: notificationStatus,
                      headPhoneStrategy:
                          HeadPhoneStrategy.pauseOnUnplugPlayOnPlug,
                      loopMode: LoopMode.playlist);

                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => NowPlaying2())));
                }),
                leading: QueryArtworkWidget(
                  artworkHeight: 55,
                  artworkWidth: 55,
                  id: songs.id!,
                  type: ArtworkType.AUDIO,
                  artworkFit: BoxFit.cover,
                  artworkQuality: FilterQuality.high,
                  size: 2000,
                  quality: 100,
                  artworkBorder: BorderRadius.circular(10),
                  nullArtworkWidget: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: Image.asset(
                      'assets/images/musify copy0.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                subtitle: Text(
                  songs.artist!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontFamily: "Inter",
                  ),
                ),
                title: Text(
                  songs.songname!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      color: Colors.white,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.bold),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    addToPlaylist(songindex: index),
                    addToFav(index: index),
                  ],
                ),
              ),
            );
          });
    });
  }

  playerOnTap() {
    List<Songs> dbsongs = SongBox.getInstance().values.toList();
    for (var item in dbsongs) {
      convertAudios.add(Audio.file(item.songurl!,
          metas: Metas(
              title: item.songname,
              artist: item.artist,
              id: item.id.toString())));
    }
  }
}
