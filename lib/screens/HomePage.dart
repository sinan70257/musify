import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:musik/widgets/Cards.dart';
import 'package:musik/widgets/SearchBar.dart';
import 'package:musik/widgets/TitleWidget.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:rxdart/rxdart.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final OnAudioQuery _audioQuery = OnAudioQuery();

  AssetsAudioPlayer player = AssetsAudioPlayer();
  final AudioPlayer _player = AudioPlayer(androidApplyAudioAttributes: true);
  List<SongModel> songs = [];
  String currentSongTitle = " ";
  String currrentArtist = " ";
  int currentIndex = 0;
  bool isPlayerVisible = false;
  late AnimationController _animationController;
  bool toggle = false;
  Duration progress1 = Duration();

  bool isPlaying = false;

  void _changePlayerVisible() {
    setState(() {
      isPlayerVisible = !isPlayerVisible;
    });
  }

  Stream<DurationState> get _durationStateStream =>
      Rx.combineLatest2<Duration, Duration?, DurationState>(
          _player.positionStream,
          _player.durationStream,
          (positon, duration) => DurationState(
              position: positon, total: duration ?? Duration.zero));

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));
    _player.currentIndexStream.listen((index) {
      if (index != null) {
        _updateCurrentPlayingDetails(index);
      }
    });

    requestStoragePermission();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isPlayerVisible) {
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                _changePlayerVisible();
                // Navigator.of(context).push(
                //     MaterialPageRoute(builder: ((context) => HomePage())));
              },
              icon: const Icon(
                Icons.arrow_circle_left_outlined,
                color: Colors.white,
                size: 40,
              )),
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
                  Container(
                    width: 300,
                    height: 300,
                    decoration: const BoxDecoration(
                        // shape: BoxShape.rectangle,
                        // border: Border.all(),
                        // borderRadius: BorderRadius.circular(5),
                        ),
                    child: QueryArtworkWidget(
                        id: songs[currentIndex].id, type: ArtworkType.AUDIO),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    currentSongTitle,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w900),
                  ),
                  Text(
                    currrentArtist,
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
                          onPressed: () {},
                          icon: Icon(
                            Icons.loop,
                            color: Colors.white,
                            size: 30,
                          )),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.shuffle,
                            color: Colors.white,
                            size: 30,
                          )),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.favorite_border_outlined,
                            color: Colors.white,
                            size: 30,
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      Container(
                        width: 360,
                        child: StreamBuilder<DurationState>(
                          stream: _durationStateStream,
                          builder: (context, snapshot) {
                            final durationstate = snapshot.data;
                            final progress =
                                durationstate?.position ?? Duration.zero;
                            final total = durationstate?.total ?? Duration.zero;
                            progress1 = progress;

                            return ProgressBar(
                              baseBarColor: Colors.white.withOpacity(0.5),
                              progressBarColor: Colors.white,
                              thumbColor: Colors.white,
                              thumbRadius: 5,
                              // barHeight: 1,
                              timeLabelPadding: 5,
                              // timeLabelLocation: TimeLabelLocation.sides,
                              progress: progress,

                              timeLabelTextStyle:
                                  TextStyle(color: Colors.white),
                              total: total,
                              onSeek: (duration) {
                                // print('User selected a new time: $duration');
                                _player.seek(duration);
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
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 40,
                      ),
                      IconButton(
                          iconSize: 40,
                          onPressed: () {
                            if (_player.hasPrevious) {
                              _player.seekToPrevious();
                            }
                          },
                          icon: Icon(
                            Icons.skip_previous_rounded,
                            color: Colors.white,
                          )),
                      IconButton(
                          onPressed: () {
                            _player.seek(progress1 - Duration(seconds: 10));
                          },
                          icon: Icon(
                            Icons.fast_rewind_rounded,
                            color: Colors.white,
                          )),
                      Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(101),
                            color: Color.fromARGB(255, 255, 255, 255)),
                        child: IconButton(
                          // splashColor: Colors.lightGreenAccent,
                          iconSize: 70,
                          onPressed: () => _handleOnPress(),
                          icon: AnimatedIcon(
                              color: Color.fromARGB(255, 0, 0, 0),
                              size: 50,
                              icon: AnimatedIcons.play_pause,
                              progress: _animationController),
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            _player.seek(progress1 + Duration(seconds: 10));
                          },
                          icon: Icon(
                            Icons.fast_forward_rounded,
                            color: Colors.white,
                          )),
                      IconButton(
                          iconSize: 40,
                          onPressed: () {
                            _player.seekToNext();
                          },
                          icon: Icon(
                            Icons.skip_next_rounded,
                            color: Colors.white,
                          )),
                      SizedBox(
                        width: 40,
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      );
    } else
      // ignore: curly_braces_in_flow_control_structures
      return Scaffold(
        backgroundColor: Colors.black,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(120.0),
          child: Container(
              decoration: const BoxDecoration(color: Colors.black),
              child: Column(
                children: const [
                  BannerWidget(),
                  SearchBar(),
                ],
              )),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Column(
              children: [
                Cards(),
                FutureBuilder<List<SongModel>>(
                    future: _audioQuery.querySongs(
                        sortType: null,
                        orderType: OrderType.ASC_OR_SMALLER,
                        uriType: UriType.EXTERNAL,
                        ignoreCase: true),
                    builder: (context, item) {
                      if (item.data == null) {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        );
                      }
                      if (item.data!.isEmpty) {
                        return const Center(
                          child: Text(
                            "No songs found",
                            style: TextStyle(color: Colors.grey),
                          ),
                        );
                      }
                      songs.clear();
                      songs = item.data!;

                      return ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(4),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 75, 75, 75),
                                  borderRadius: BorderRadius.circular(10)),
                              child: ListTile(
                                onTap: () async {
                                  isPlaying = true;
                                  _changePlayerVisible();
                                  toast(context,
                                      "Playing " + item.data![index].title);
                                  // String? uri = item.data![index].uri;

                                  // await _player
                                  // .setAudioSource(AudioSource.uri(Uri.parse(uri!)));
                                  await _player.setAudioSource(
                                      createPlaylist(item.data!),
                                      initialIndex: index);
                                  await _player.play();

                                  // await player.open(Audio(uri));

                                  // Navigator.of(context).push(MaterialPageRoute(
                                  //     builder: ((context) => NowPlaying())));
                                },
                                leading: QueryArtworkWidget(
                                    artworkBorder: BorderRadius.circular(2),
                                    id: item.data![index].id,
                                    type: ArtworkType.AUDIO),
                                // leading: ClipRRect(
                                //   borderRadius: BorderRadius.circular(5),
                                //   child: Image.asset(
                                //       'assets/images/The_Weeknd_-_After_Hours.png'),
                                // ),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    // Padding(
                                    //     padding: EdgeInsets.only(right: 10),
                                    //     child: IconButton(
                                    //         onPressed: () {},
                                    //         icon: Icon(
                                    //           Icons.playlist_add,
                                    //           color: Colors.white,
                                    //           size: 30,
                                    //         ))),
                                    IconButton(
                                        icon: toggle
                                            ? Icon(
                                                Icons.favorite_border,
                                                color: Colors.white,
                                              )
                                            : Icon(
                                                Icons.favorite,
                                                color: Colors.white,
                                              ),
                                        onPressed: () {
                                          setState(() {
                                            // Here we changing the icon.
                                            toggle = !toggle;
                                          });
                                        }),
                                  ],
                                ),
                                subtitle: Text(
                                  item.data![index].displayName,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Inter",
                                      overflow: TextOverflow.ellipsis),
                                ),
                                title: Text(
                                  item.data![index].title,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Inter",
                                      overflow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          );
                        },
                        itemCount: item.data!.length,
                      );
                    }),
              ],
            ),
          ),
        ),
        // body: Column(
        //   children: [
        //     Expanded(
        //       flex: 6,
        //       child: Container(
        //         // height: 455,
        //         child: SingleChildScrollView(
        //           child: Padding(
        //             padding: const EdgeInsets.all(8.0),
        //             child: Column(
        //               crossAxisAlignment: CrossAxisAlignment.start,
        //               children: const [
        //                 Cards(),
        //                 AllSongs(),
        //               ],
        //             ),
        //           ),
        //         ),
        //       ),
        //     ),
        //     Expanded(
        //       flex: 1,
        //       child: Container(
        //         child: FloatingController(),
        //       ),
        //     )
        //   ],
        // ),
      );
  }

  void toast(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(text),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    ));
  }

  void requestStoragePermission() async {
    if (!kIsWeb) {
      bool permissionStatus = await _audioQuery.permissionsStatus();
      if (!permissionStatus) {
        await _audioQuery.permissionsRequest();
      }
      setState(() {});
    }
  }

  ConcatenatingAudioSource createPlaylist(List<SongModel> songs) {
    List<AudioSource> scources = [];
    for (var song in songs) {
      scources.add(AudioSource.uri(
        Uri.parse(song.uri!),
        tag: MediaItem(
          // Specify a unique ID for each media item:
          id: "${songs[currentIndex].id}",
          // Metadata to display in the notification:
          album: "${songs[currentIndex].album}",
          title: songs[currentIndex].displayNameWOExt,
          artUri: Uri.parse('https://example.com/albumart.jpg'),
        ),
      ));
    }
    return ConcatenatingAudioSource(children: scources);
  }

  void _updateCurrentPlayingDetails(int index) {
    setState(() {
      if (songs.isNotEmpty) {
        currentSongTitle = songs[index].title;
        currrentArtist = songs[index].artist!;
        currentIndex = index;
      }
    });
  }

  void _handleOnPress() {
    setState(() {
      isPlaying = !isPlaying;

      if (_player.playing) {
        _animationController.reverse();

        _player.pause();
      } else {
        _animationController.forward();
        if (_player.currentIndex != null) {
          _player.play();
        }
      }
    });
  }
}

class DurationState {
  DurationState({this.position = Duration.zero, this.total = Duration.zero});
  Duration position, total;
}
