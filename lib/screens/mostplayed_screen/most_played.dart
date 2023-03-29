// ignore_for_file: camel_case_types, avoid_print, file_names

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:musik/Bloc/most_played/most_played_bloc.dart';
import 'package:musik/colors/colors.dart';
import 'package:musik/model/dbfunctions.dart';
import 'package:musik/model/mostPlayed.dart';
import 'package:musik/screens/other_screen/bottom_navbar.dart';
import 'package:musik/screens/nowplaying_screen/now_playing.dart';
import 'package:musik/screens/favourite_screen/widgets/addTofavourite.dart';
import 'package:musik/screens/playlist_screen/widgets/addToPlaylist.dart';
import 'package:on_audio_query/on_audio_query.dart';

class mostlyPlayed extends StatelessWidget {
  mostlyPlayed({super.key});

  AssetsAudioPlayer player = AssetsAudioPlayer.withId("0");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => BottomNavbar(),
              ));
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: Row(
          children: const [
            Text(
              "M",
              style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 35,
                  fontWeight: FontWeight.w900,
                  color: Colors.grey),
            ),
            Text(
              "ost Played",
              style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 35,
                  fontWeight: FontWeight.w900,
                  color: Colors.white),
            ),
          ],
        ),
      )),
      backgroundColor: const Color.fromARGB(255, 21, 21, 21),
      body: SafeArea(
        child: Column(
          children: [showmostlyplayed()],
        ),
      ),
    );
  }

  showmostlyplayed() {
    return BlocBuilder<MostPlayedBloc, MostPlayedState>(
      builder: (context, state) {
        return ValueListenableBuilder(
            valueListenable: mostplayedsongs.listenable(),
            builder: (context, Box<MostPlayed> mpsongbox, _) {
              if (state.finalmpsongs.isNotEmpty) {
                return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: state.finalmpsongs.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(0, 5, 0, 2),
                        child: ListTile(
                          onTap: (() {
                            print(player.getCurrentAudioTitle);

                            player.open(
                                Playlist(
                                    audios: state.songs, startIndex: index),
                                showNotification: notificationStatus,
                                headPhoneStrategy:
                                    HeadPhoneStrategy.pauseOnUnplug,
                                loopMode: LoopMode.playlist);

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: ((context) => NowPlaying2()),
                              ),
                            );
                          }),
                          leading: QueryArtworkWidget(
                            artworkHeight: 55,
                            artworkWidth: 55,
                            id: state.finalmpsongs[index].id,
                            type: ArtworkType.AUDIO,
                            artworkFit: BoxFit.cover,
                            artworkQuality: FilterQuality.high,
                            size: 200,
                            quality: 100,
                            artworkBorder: BorderRadius.circular(10),
                            nullArtworkWidget: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              child: Image.asset(
                                'assets/images/musify copy0.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          subtitle: Text(
                            state.finalmpsongs[index].artist,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontFamily: "Inter",
                            ),
                          ),
                          title: Text(
                            state.finalmpsongs[index].songname,
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
              } else {
                return const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Align(
                    heightFactor: 7.5,
                    child: Center(
                      child: Text(
                          '''Your most played songs will be listed here ''',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w300)),
                    ),
                  ),
                );
              }
            });
      },
    );
  }
}
