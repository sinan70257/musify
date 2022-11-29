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
        bottomSheet: FloatingController(),
        body: ValueListenableBuilder<Box<favsongs>>(
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
                itemCount: allDbsongs.length,
                padding: EdgeInsets.only(top: 10),
                itemBuilder: (context, index) {
                  if (allDbsongs[index].songname == "ooom") {
                    return ListTile();
                  }
                  return Dismissible(
                    key: ObjectKey(allDbsongs[index]),
                    onDismissed: (direction) {
                      setState(() {
                        favsongsdb.deleteAt(index);
                      });
                    },
                    child: ListTile(
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
                            borderRadius: BorderRadius.all(Radius.circular(10)),
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
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      backgroundColor:
                                          Color.fromARGB(255, 50, 50, 50),
                                      title: const Text(
                                        "Remove from favourites",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      content: const Text("Are you Sure ?",
                                          style:
                                              TextStyle(color: Colors.white)),
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
                                              Navigator.pop(context);
                                            },
                                            child: const Text("Remove",
                                                style: TextStyle(
                                                    color: (Color.fromARGB(
                                                        255, 213, 213, 213))))),
                                      ],
                                    );
                                  }));
                            },
                            icon: Icon(
                              Icons.delete_outline,
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
                        )),
                  );
                },
              );
            })));
  }
}
