// ignore_for_file: must_be_immutable

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:musik/colors/colors.dart';
import 'package:musik/model/dbfunctions.dart';
import 'package:musik/model/playlistmodel.dart';
import 'package:musik/model/songModel.dart';

import 'package:flutter/material.dart';

import 'package:hive_flutter/adapters.dart';
import 'package:musik/screens/nowplaying_screen/now_playing.dart';
import 'package:on_audio_query/on_audio_query.dart';

class ScreenPlaylist extends StatefulWidget {
  ScreenPlaylist(
      {super.key,
      required this.allPlaylistSongs,
      required this.playlistindex,
      required this.playlistname});

  List<Songs> allPlaylistSongs = [];
  int playlistindex;
  String playlistname;

  @override
  State<ScreenPlaylist> createState() => _ScreenPlaylistState();
}

class _ScreenPlaylistState extends State<ScreenPlaylist> {
  AssetsAudioPlayer player = AssetsAudioPlayer.withId('0');
  List<Audio> plstsongs = [];

  @override
  void initState() {
    for (var song in widget.allPlaylistSongs) {
      plstsongs.add(Audio.file(song.songurl.toString(),
          metas: Metas(
              title: song.songname,
              artist: song.artist,
              id: song.id.toString())));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 21, 21, 21),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 370,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 0, 0, 0),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
                    Image.asset(
                      "assets/logo.jpg",
                      height: 280,
                      width: 280,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 15, 15, 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.playlistname,
                            style: const TextStyle(
                                fontSize: 50,
                                color: Colors.white,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              favoriteList()
            ],
          ),
        ),
      ),
    );
  }

  favoriteList() {
    return ValueListenableBuilder<Box<PlaylistSongs>>(
        valueListenable: playlistbox.listenable(),
        builder: (context, value, _) {
          List<PlaylistSongs> plsongs = playlistbox.values.toList();
          List<Songs>? songs = plsongs[widget.playlistindex].playlistssongs;
          if (songs!.isEmpty) {
            return const Align(
              heightFactor: 7.5,
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Center(
                  child: Text(
                    "No Songs Added",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            );
          }
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: songs.length,
              itemBuilder: ((context, index) {
                return ListTile(
                  onTap: () {
                    player.open(Playlist(audios: plstsongs, startIndex: index),
                        showNotification: notificationStatus,
                        loopMode: LoopMode.playlist);
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => NowPlaying2(),
                    ));
                  },
                  leading: QueryArtworkWidget(
                    artworkHeight: 55,
                    artworkWidth: 55,
                    artworkFit: BoxFit.cover,
                    id: songs[index].id!,
                    type: ArtworkType.AUDIO,
                    artworkQuality: FilterQuality.high,
                    size: 2000,
                    quality: 100,
                    artworkBorder: BorderRadius.circular(10),
                    nullArtworkWidget: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(50)),
                      child: Image.asset(
                        'assets/images/musify copy0.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  subtitle: Text(
                    songs[index].artist!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        color: Colors.grey,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.bold),
                  ),
                  title: Text(
                    songs[index].songname!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        color: Colors.white,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.bold),
                  ),
                  trailing: IconButton(
                    onPressed: (() {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            backgroundColor:
                                const Color.fromARGB(255, 50, 50, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            title: const Text(
                              "Delete song from playlist",
                              style: TextStyle(color: Colors.white),
                            ),
                            content: const Text(
                              "Are You Sure ?",
                              style: TextStyle(color: Colors.white),
                            ),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text("Cancel",
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 213, 213, 213)))),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    setState(() {
                                      songs.removeAt(index);
                                      plsongs.removeAt(index);
                                      playlistbox.putAt(
                                          widget.playlistindex,
                                          PlaylistSongs(
                                              playlistname: widget.playlistname,
                                              playlistssongs: songs));
                                      initState();
                                    });
                                    // setState(() {

                                    // update();
                                    // setState(() {
                                    //   plsongs = playlistbox.values.toList();
                                    // });

                                    // Navigator.pop(context);
                                    // });
                                  },
                                  child: const Text("Delete",
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 213, 213, 213))))
                            ],
                          );
                        },
                      );
                    }),
                    icon: const Icon(
                      Icons.delete_outline_outlined,
                      color: Colors.grey,
                    ),
                  ),
                );
              }),
            ),
          );
        });
  }

  void update() {
    widget.allPlaylistSongs = [];
    for (var song in widget.allPlaylistSongs) {
      plstsongs.add(Audio.file(song.songurl.toString(),
          metas: Metas(
              title: song.songname,
              artist: song.artist,
              id: song.id.toString())));
    }
  }
}
