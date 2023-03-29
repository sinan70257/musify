import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:musik/Bloc/favourites/favourites_bloc.dart';
import 'package:musik/colors/colors.dart';
import 'package:musik/model/dbfunctions.dart';
import 'package:musik/model/favouriteModel.dart';
import 'package:musik/screens/other_screen/bottom_navbar.dart';
import 'package:musik/screens/nowplaying_screen/now_playing.dart';

import 'package:musik/widgets/floating_controller.dart';
import 'package:on_audio_query/on_audio_query.dart';

class Favourites extends StatelessWidget {
  Favourites({super.key});

  List<Audio> allsongs = [];
  AssetsAudioPlayer audioPlayer = AssetsAudioPlayer.withId('0');

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: ((c) => BottomNavbar()),
                ),
              );
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        title: Row(
          children: const [
            Text(
              "F",
              style: TextStyle(
                  fontFamily: "Inter",
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                  fontSize: 35),
            ),
            Text(
              "avourites",
              style: TextStyle(
                  fontFamily: "Inter",
                  fontWeight: FontWeight.bold,
                  fontSize: 35),
            ),
          ],
        ),
        backgroundColor: Colors.black,
      ),
      bottomSheet: const FloatingController(),
      body: BlocBuilder<FavouritesBloc, FavouritesState>(
        builder: (context, state) {
          return ValueListenableBuilder<Box<favsongs>>(
            valueListenable: Hive.box<favsongs>('favsongs').listenable(),
            builder: ((context, Box<favsongs> alldbfavsongs, child) {
              List<favsongs> allDbsongs = alldbfavsongs.values.toList();
              if (favsongsdb.isEmpty) {
                return const Center(
                  child: Text(
                    "No Favourites",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                );
              }
              // ignore: unnecessary_null_comparison
              if (favsongsdb == null) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView.builder(
                itemCount: allDbsongs.length,
                padding: const EdgeInsets.only(top: 10),
                itemBuilder: (context, index) {
                  return ListTile(
                      onTap: (() {
                        onplay();
                        audioPlayer.open(
                            Playlist(audios: allsongs, startIndex: index),
                            showNotification: notificationStatus,
                            headPhoneStrategy: HeadPhoneStrategy.pauseOnUnplug,
                            loopMode: LoopMode.playlist);

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => NowPlaying2())));
                      }),
                      leading: QueryArtworkWidget(
                        artworkHeight: 55,
                        artworkWidth: 55,
                        id: allDbsongs[index].id!,
                        type: ArtworkType.AUDIO,
                        artworkFit: BoxFit.cover,
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
                      trailing: IconButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: ((context) {
                                  return AlertDialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    backgroundColor:
                                        const Color.fromARGB(255, 50, 50, 50),
                                    title: const Text(
                                      "Remove from favourites",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    content: const Text("Are you Sure ?",
                                        style: TextStyle(color: Colors.white)),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text("Cancel",
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 213, 213, 213))),
                                      ),
                                      TextButton(
                                          onPressed: () {
                                            favsongsdb.deleteAt(index);
                                            onplay();
                                            Navigator.pop(context);
                                            // Navigator.of(context)
                                            //     .pushReplacement(
                                            //         MaterialPageRoute(
                                            //   builder: (context) =>
                                            //       Favourites(),
                                            // ));
                                          },
                                          child: const Text("Remove",
                                              style: TextStyle(
                                                  color: (Color.fromARGB(
                                                      255, 213, 213, 213))))),
                                    ],
                                  );
                                }));
                          },
                          icon: const Icon(
                            Icons.delete_outline,
                            color: Colors.grey,
                          )),
                      subtitle: Text(
                        allDbsongs[index].artist!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontFamily: "Inter",
                        ),
                      ),
                      title: Text(
                        allDbsongs[index].songname!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            color: Colors.white,
                            fontFamily: "Inter",
                            fontWeight: FontWeight.bold),
                      ));
                },
              );
            }),
          );
        },
      ),
    );
  }

  onplay() {
    final favsongsdb = Hive.box<favsongs>("favsongs").values.toList();
    for (var item in favsongsdb) {
      allsongs.add(Audio.file(item.songurl.toString(),
          metas: Metas(
              artist: item.artist,
              title: item.songname,
              id: item.id.toString())));
    }
  }
}
