import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:musik/model/songModel.dart';
import 'package:musik/screens/nowPlaying2.dart';
import 'package:musik/widgets/addTofavourite.dart';
import 'package:on_audio_query/on_audio_query.dart';

class allSongsScreen extends StatefulWidget {
  allSongsScreen({super.key});

  @override
  State<allSongsScreen> createState() => _allSongsScreenState();
}

class _allSongsScreenState extends State<allSongsScreen> {
  late bool isplaying;
  late bool playerVisibility;

  final box = SongBox.getInstance();
  List<Audio> convertAudios = [];
  final AssetsAudioPlayer _audioPlayer = AssetsAudioPlayer.withId('0');

  @override
  void initState() {
    // TODO: implement initState
    List<Songs> dbsongs = box.values.toList();
    for (var item in dbsongs) {
      convertAudios.add(Audio.file(item.songurl!,
          metas: Metas(
              title: item.songname,
              artist: item.artist,
              id: item.id.toString())));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return ValueListenableBuilder<Box<Songs>>(
        valueListenable: box.listenable(),
        builder: ((context, Box<Songs> allsongbox, child) {
          List<Songs> allDbdongs = allsongbox.values.toList();
          if (allDbdongs.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (allDbdongs == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: allDbdongs.length,
              itemBuilder: (context, index) {
                bool fav = true;
                Songs songs = allDbdongs[index];
                return Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 2),
                  child: ListTile(
                    onTap: (() {
                      _audioPlayer.open(
                          Playlist(audios: convertAudios, startIndex: index),
                          showNotification: true,
                          headPhoneStrategy:
                              HeadPhoneStrategy.pauseOnUnplugPlayOnPlug,
                          loopMode: LoopMode.playlist);
                      setState(() {});
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => NowPlaying2())));
                    }),
                    leading: QueryArtworkWidget(
                      id: songs.id!,
                      type: ArtworkType.AUDIO,
                      artworkFit: BoxFit.cover,
                      artworkQuality: FilterQuality.high,
                      size: 2000,
                      quality: 100,
                      artworkBorder: BorderRadius.circular(10),
                      nullArtworkWidget: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        child: Image.asset(
                          'assets/images/The_Weeknd_-_After_Hours.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    subtitle: Text(
                      songs.artist!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontFamily: "Inter",
                      ),
                    ),
                    title: Text(
                      songs.songname!,
                      style: const TextStyle(
                          color: Colors.white,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.bold),
                    ),
                    // trailing: Row(
                    //   mainAxisSize: MainAxisSize.min,
                    //   children: [
                    //     Padding(
                    //         padding: EdgeInsets.only(right: 10),
                    //         child: IconButton(
                    //             onPressed: () {},
                    //             icon: Icon(
                    //               Icons.playlist_add,
                    //               color: Colors.white,
                    //               size: 30,
                    //             ))),
                    //     IconButton(
                    //         icon: toggle
                    //             ? Icon(
                    //                 Icons.favorite_border,
                    //                 color: Colors.white,
                    //               )
                    //             : Icon(
                    //                 Icons.favorite,
                    //                 color: Colors.white,
                    //               ),
                    //         onPressed: () {
                    //           setState(() {
                    //             // Here we changing the icon.
                    //             toggle = !toggle;
                    //           });
                    //         }),
                    //   ],
                    // ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        addToFav(index: index),
                        // IconButton(
                        //   onPressed: (() {
                        //     showModalBottomSheet(
                        //       backgroundColor: Colors.black,
                        //       shape: const RoundedRectangleBorder(
                        //         borderRadius: BorderRadius.vertical(
                        //           top: Radius.circular(20),
                        //         ),
                        //       ),
                        //       context: context,
                        //       builder: ((context) {
                        //         return SizedBox(
                        //           height: height * 0.13,
                        //           child: Column(
                        //             children: [
                        //               // AddToPlalistbutton(songindex: index),
                        //               SizedBox(
                        //                 height: height * 0.011,
                        //               ),
                        //               addToFavourite(index: index)
                        //               /* TextButton(
                        //                   onPressed: () {},
                        //                   child: const Text("Add to Favorites")) */
                        //             ],
                        //           ),
                        //         );
                        //       }),
                        //     );
                        //   }),
                        //   icon: const Icon(
                        //     Icons.more_vert,
                        //     color: Colors.grey,
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                );
              });
        }));
  }
}
