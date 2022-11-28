import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:musik/model/dbfunctions.dart';
import 'package:musik/model/favouriteModel.dart';
import 'package:musik/screens/nowPlaying2.dart';
import 'package:musik/widgets/Favourites.dart';
import 'package:on_audio_query/on_audio_query.dart';

import '../widgets/FloatingControler.dart';

class Favourites extends StatefulWidget {
  const Favourites({super.key});

  @override
  State<Favourites> createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  List<Audio> allsongs = [];
  AssetsAudioPlayer audioPlayer = AssetsAudioPlayer.withId('0');
  @override
  void initState() {
    // TODO: implement initState
    final favSongsdb = Hive.box<favsongs>('favsongs').values.toList();
    for (var item in favSongsdb) {
      allsongs.add(Audio.file(item.songurl.toString(),
          metas: Metas(
              artist: item.artist,
              title: item.songname,
              id: item.id.toString())));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Row(
            children: const [
              Text(
                "F",
                style: TextStyle(
                    fontFamily: "Inter",
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                    fontSize: 25),
              ),
              Text(
                "avourites",
                style: TextStyle(
                    fontFamily: "Inter",
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
            ],
          ),
          backgroundColor: Colors.black,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ValueListenableBuilder<Box<favsongs>>(
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
                    if (favsongsdb == null) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: allDbsongs.length,
                      padding: EdgeInsets.only(top: 10),
                      itemBuilder: (context, index) {
                        return ListTile(
                            onTap: (() {
                              audioPlayer.open(
                                  Playlist(audios: allsongs, startIndex: index),
                                  showNotification: true,
                                  headPhoneStrategy:
                                      HeadPhoneStrategy.pauseOnUnplug,
                                  loopMode: LoopMode.playlist);
                              setState(() {});
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) => NowPlaying2())));
                            }),
                            leading: QueryArtworkWidget(
                              id: allDbsongs[index].id!,
                              type: ArtworkType.AUDIO,
                              artworkFit: BoxFit.cover,
                              size: 200,
                              quality: 100,
                              nullArtworkWidget: ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                child: Image.asset(
                                  'assets/images/The_Weeknd_-_After_Hours.png',
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
                                          title: const Text(
                                              "Remove from favourites"),
                                          content: const Text("Are you Sure?"),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text("Cancel"),
                                            ),
                                            TextButton(
                                                onPressed: () {
                                                  favsongsdb.deleteAt(index);
                                                  Navigator.pop(context);
                                                },
                                                child: const Text("Remove"))
                                          ],
                                        );
                                      }));
                                },
                                icon: Icon(
                                  Icons.favorite,
                                  color: Colors.white,
                                )),
                            subtitle: Text(
                              allDbsongs[index].artist!,
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Inter",
                              ),
                            ),
                            title: Text(
                              allDbsongs[index].songname!,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.bold),
                            ));
                      },
                    );
                  }))
            ],
          ),
        ));
  }
}
