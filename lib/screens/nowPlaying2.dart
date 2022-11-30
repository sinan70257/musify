import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:musik/model/songModel.dart';
import 'package:musik/screens/HomePage.dart';
import 'package:musik/screens/SplashScreen.dart';
import 'package:musik/widgets/addTofavourite.dart';
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
              // const SizedBox(
              //   height: 50,
              // ),
              // NowPlayingClip()
              Column(
                children: [
                  // ClipRRect(
                  //   borderRadius: BorderRadius.circular(12),
                  //   child: Image.asset(
                  //       "assets/images/The_Weeknd_-_After_Hours.png"),
                  // ),
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
                          'assets/images/The_Weeknd_-_After_Hours.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: width * 0.75,
                    child: Text(
                      player.getCurrentAudioTitle,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
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
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.playlist_add,
                            color: Colors.white,
                            size: 30,
                          )),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              if (isRepeat) {
                                player.setLoopMode(LoopMode.none);
                                isRepeat = false;
                              } else {
                                player.setLoopMode(LoopMode.single);
                              }
                            });
                          },
                          icon: isRepeat
                              ? const Icon(
                                  Icons.repeat,
                                  color: Colors.white,
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
                              ? Icon(
                                  Icons.shuffle,
                                  color: Colors.white,
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
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      Container(
                        width: 360,
                        child: PlayerBuilder.realtimePlayingInfos(
                          player: player,
                          builder: (context, RealtimePlayingInfos) {
                            final duration =
                                RealtimePlayingInfos.current!.audio.duration;
                            final position =
                                RealtimePlayingInfos.currentPosition;

                            return ProgressBar(
                              baseBarColor: Colors.white.withOpacity(0.5),
                              progressBarColor: Colors.white,
                              thumbColor: Colors.white,
                              thumbRadius: 5,
                              // barHeight: 1,
                              timeLabelPadding: 5,
                              // timeLabelLocation: TimeLabelLocation.sides,
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
                        // child: ProgressBar(
                        //   baseBarColor: Colors.white.withOpacity(0.5),
                        //   progressBarColor: Colors.white,
                        //   thumbColor: Colors.white,
                        //   thumbRadius: 5,
                        //   // barHeight: 1,
                        //   timeLabelPadding: 5,
                        //   // timeLabelLocation: TimeLabelLocation.sides,
                        //   progress: infos.currentPosition,
                        //   total: infos.duration,
                        //   onSeek: (duration) {
                        //     // print('User selected a new time: $duration');
                        //     player.seek(duration);
                        //   },
                        // ),
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
                                await player.previous();
                                setState(() {});
                                if (isPlaying == false) {
                                  await player.pause();
                                }
                              },
                              icon: Icon(
                                Icons.skip_previous_rounded,
                                color: Colors.white,
                              ));
                        }),
                      ),
                      // SizedBox(
                      //   width: 40,
                      // ),
                      IconButton(
                          onPressed: () async {
                            await player.seekBy(const Duration(seconds: -10));
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
                            await player.seekBy(Duration(seconds: 10));
                          },
                          icon: Icon(
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
                                  if (isPlaying == false) {
                                    await player.pause();
                                  }
                                },
                                icon: Icon(
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
  }
}
