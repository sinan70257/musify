import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:musik/widgets/Cards.dart';
import 'package:musik/widgets/FloatingControler.dart';
import 'package:musik/widgets/SearchBar.dart';
import 'package:musik/widgets/TitleWidget.dart';
import 'package:musik/widgets/allSongs.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool mp = false;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    // if (isPlayerVisible) {
    //   return NowPlaying2();
    // } else
    // ignore: curly_braces_in_flow_control_structures
    return Scaffold(
      // bottomSheet: FloatingController(),
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
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
              allSongsScreen(),
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

  // ConcatenatingAudioSource createPlaylist(List<SongModel> songs) {
  //   List<AudioSource> scources = [];

  //   for (var song in songs) {
  //     setState(() {});
  //     scources.add(AudioSource.uri(
  //       Uri.parse(song.uri!),
  //       tag: MediaItem(
  //         // Specify a unique ID for each media item:
  //         id: "${songs[currentIndex].id}",
  //         // Metadata to display in the notification:
  //         album: "${songs[currentIndex].album}",
  //         title: songs[currentIndex].displayNameWOExt,
  //         // artUri: Uri.parse(''),
  //       ),
  //     ));
  //   }
  //   return ConcatenatingAudioSource(children: scources);
  // }

}
