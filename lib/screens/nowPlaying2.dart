import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:marquee/marquee.dart';
import 'package:musik/model/dbfunctions.dart';
import 'package:musik/model/mostPlayed.dart';
import 'package:musik/model/recentlyPlayed.dart';
import 'package:musik/model/songModel.dart';
import 'package:musik/screens/SplashScreen.dart';
import 'package:musik/widgets/addTofavourite.dart';
import 'package:musik/widgets/playlists/addToPlaylist.dart';
import 'package:on_audio_query/on_audio_query.dart';

class NowPlaying2 extends StatefulWidget {
  const NowPlaying2({super.key});

  @override
  State<NowPlaying2> createState() => _NowPlaying2State();
}

class _NowPlaying2State extends State<NowPlaying2> {
  final player = AssetsAudioPlayer.withId('0');
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  late List<Songs> dbsongs;
  bool isRepeat = false;
  bool isPlaying = false;
  List<MostPlayed> allmostplayedsongs = mostplayedsongs.values.toList();

  @override
  void initState() {
    dbsongs = box.values.toList();

    super.initState();
    setState(() {});
  }
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();

  // }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return ValueListenableBuilder<Box<Songs>>(
        valueListenable: box.listenable(),
        builder: ((context, Box<Songs> allsongbox, child) {
          List<Songs> allDbdongs = allsongbox.values.toList();
          return player.builderCurrent(builder: ((context, playing) {
            return Scaffold(
              appBar: AppBar(
                leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    )),
                // leading: IconButton(
                //     onPressed: () {
                //       // Navigator.of(context).push(
                //       //     MaterialPageRoute(builder: ((context) => HomePage())));
                //     },
                //     icon: const Icon(
                //       Icons.arrow_circle_left_outlined,
                //       color: Colors.white,
                //       size: 40,
                //     )),
                centerTitle: true,
                backgroundColor: Colors.black,
                title: const Text(
                  "Now Playing",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
              ),
              backgroundColor: Colors.black,
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          width: 300,
                          height: 350,
                          child: QueryArtworkWidget(
                            id: int.parse(playing.audio.audio.metas.id!),
                            type: ArtworkType.AUDIO,
                            artworkHeight: 300,
                            artworkWidth: 350,
                            artworkBorder: BorderRadius.circular(5),
                            artworkFit: BoxFit.cover,
                            nullArtworkWidget: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Image.asset(
                                'assets/images/musify copy0.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: width * 0.8,
                          height: height * .03,
                          child: Marquee(
                            text: player.getCurrentAudioTitle,
                            blankSpace: 80,
                            velocity: 50,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontFamily: "Inter",
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                        Text(
                          player.getCurrentAudioArtist,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                            fontFamily: "Inter",
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            addToPlaylist(songindex: playing.index),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (isRepeat) {
                                      player.setLoopMode(LoopMode.none);
                                      isRepeat = false;
                                    } else {
                                      player.setLoopMode(LoopMode.single);
                                      isRepeat = true;
                                    }
                                  });
                                },
                                icon: isRepeat
                                    ? const Icon(
                                        Icons.repeat,
                                        color: Colors.blue,
                                        size: 30,
                                      )
                                    : const Icon(
                                        Icons.repeat,
                                        color: Colors.grey,
                                        size: 30,
                                      )),
                            IconButton(
                                onPressed: () {
                                  setState(() {});
                                  player.toggleShuffle();
                                },
                                icon: player.isShuffling.value
                                    ? const Icon(
                                        Icons.shuffle,
                                        color: Colors.blue,
                                        size: 30,
                                      )
                                    : const Icon(
                                        Icons.shuffle,
                                        color: Colors.grey,
                                        size: 30,
                                      )),
                            // IconButton(
                            //     onPressed: () {},
                            //     icon: Icon(
                            //       Icons.favorite_border_outlined,
                            //       color: Colors.white,
                            //       size: 30,
                            //     )),
                            player.builderCurrent(builder: ((context, playing) {
                              return addToFav(
                                  index: dbsongs.indexWhere((element) =>
                                      element.songname ==
                                      playing.audio.audio.metas.title));
                            }))
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Column(
                          children: [
                            Container(
                              padding:
                                  const EdgeInsets.only(left: 30, right: 30),
                              width: double.infinity,
                              child: PlayerBuilder.realtimePlayingInfos(
                                player: player,
                                builder: (context, RealtimePlayingInfos) {
                                  final duration = RealtimePlayingInfos
                                      .current!.audio.duration;
                                  final position =
                                      RealtimePlayingInfos.currentPosition;

                                  return ProgressBar(
                                    baseBarColor: Colors.white.withOpacity(0.5),
                                    progressBarColor: Colors.white,
                                    thumbColor: Colors.white,
                                    thumbRadius: 5,
                                    timeLabelPadding: 5,
                                    progress: position,
                                    timeLabelTextStyle:
                                        TextStyle(color: Colors.white),
                                    total: duration,
                                    onSeek: (duration) async {
                                      // print('User selected a new time: $duration');
                                      await player.seek(duration);
                                    },
                                  );
                                },
                              ),
                              //
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            PlayerBuilder.isPlaying(
                              player: player,
                              builder: ((context, isPlaying) {
                                return IconButton(
                                    iconSize: 40,
                                    onPressed: () async {
                                      if (playing.index == 0) {
                                        player.playlistPlayAtIndex(
                                            allDbdongs.length - 1);
                                      } else {
                                        await player.previous();
                                      }

                                      setState(() {});
                                      if (isPlaying == false) {
                                        await player.pause();
                                      }
                                    },
                                    icon: const Icon(
                                      Icons.skip_previous_rounded,
                                      color: Colors.white,
                                    ));
                              }),
                            ),

                            IconButton(
                                onPressed: () async {
                                  await player
                                      .seekBy(const Duration(seconds: -10));
                                },
                                icon: const Icon(
                                  Icons.replay_10,
                                  color: Colors.white,
                                )),
                            Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(101),
                                  color: Color.fromARGB(255, 255, 255, 255)),
                              child: Center(
                                child: PlayerBuilder.isPlaying(
                                    player: player,
                                    builder: (context, isPlaying) {
                                      return IconButton(
                                        onPressed: () async {
                                          await player.playOrPause();
                                        },
                                        icon: Icon(isPlaying
                                            ? Icons.pause
                                            : Icons.play_arrow),
                                        iconSize: 40,
                                        color: Color.fromARGB(255, 0, 0, 0),
                                      );
                                    }),
                              ),
                            ),
                            IconButton(
                                onPressed: () async {
                                  await player
                                      .seekBy(const Duration(seconds: 10));
                                },
                                icon: const Icon(
                                  Icons.forward_10,
                                  color: Colors.white,
                                )),
                            PlayerBuilder.isPlaying(
                                player: player,
                                builder: ((context, isPlaying) {
                                  return IconButton(
                                      iconSize: 40,
                                      onPressed: () async {
                                        await player.next();
                                        setState(() {});
                                        RecentlyPlayed rsongs;
                                        MostPlayed MPsongs =
                                            allmostplayedsongs[playing.index];
                                        rsongs = RecentlyPlayed(
                                            songname: dbsongs[playing.index + 1]
                                                .songname,
                                            artist: dbsongs[playing.index + 1]
                                                .artist,
                                            id: dbsongs[playing.index + 1].id,
                                            duration: dbsongs[playing.index + 1]
                                                .duration,
                                            songurl: dbsongs[playing.index + 1]
                                                .songurl);
                                        updateRecentPlayed(
                                            rsongs, playing.index + 1);
                                        updatePlayedSongsCount(
                                            MPsongs, playing.index + 1);
                                        if (isPlaying == false) {
                                          await player.pause();
                                        }
                                      },
                                      icon: const Icon(
                                        Icons.skip_next_rounded,
                                        color: Colors.white,
                                      ));
                                })),
                            // SizedBox(
                            //   width: 40,
                            // ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          }));
        }));
  }
}
