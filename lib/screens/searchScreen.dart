import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:musik/model/songModel.dart';
import 'package:musik/screens/nowPlaying2.dart';
import 'package:on_audio_query/on_audio_query.dart';

class ScreenSearch extends StatefulWidget {
  const ScreenSearch({super.key});

  @override
  State<ScreenSearch> createState() => _ScreenSearchState();
}

class _ScreenSearchState extends State<ScreenSearch> {
  final TextEditingController searchController = TextEditingController();
  final box = SongBox.getInstance();
  late List<Songs> dbSongs;
  final AssetsAudioPlayer _audioPlayer = AssetsAudioPlayer.withId('0');
  List<Audio> allSongs = [];

  @override
  void initState() {
    dbSongs = box.values.toList();

    super.initState();
  }

  late List<Songs> another = List.from(dbSongs);
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: Container(
            decoration: const BoxDecoration(color: Colors.black),
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.060,
                ),
                searchbar(context)
              ],
            )),
      ),
      backgroundColor: const Color.fromARGB(255, 21, 21, 21),
      body: SafeArea(
        child: Column(
          children: [
            // Padding(
            //     padding: const EdgeInsets.all(8), child: searchbar(context)),
            const SizedBox(
              height: 10,
            ),
            Expanded(child: searchHistory())
          ],
        ),
      ),
    );
  }

  searchbar(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
      onTap: () {},
      controller: searchController,
      onChanged: (value) => updateList(value),
      decoration: const InputDecoration(
        filled: true,
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 2.5)),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 2.5)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 2.5)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 2.5)),
        hintText: "Search songsaq ",
        hintStyle: TextStyle(color: Colors.grey),
      ),
    );
  }

  searchHistory() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: another.isEmpty
          ? const Center(
              child: Text(
              "No Songs Found",
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
            ))
          : ListView.builder(
              itemCount: another.length,
              itemBuilder: ((context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: ListTile(
                    onTap: () {
                      _audioPlayer.open(
                          Playlist(audios: allSongs, startIndex: index),
                          showNotification: true,
                          headPhoneStrategy: HeadPhoneStrategy.pauseOnUnplug,
                          loopMode: LoopMode.playlist);
                      setState(() {});
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => const NowPlaying2()),
                        ),
                      );
                    },
                    leading: QueryArtworkWidget(
                      artworkFit: BoxFit.cover,
                      id: another[index].id!,
                      type: ArtworkType.AUDIO,
                      artworkQuality: FilterQuality.high,
                      size: 2000,
                      quality: 100,
                      artworkBorder: BorderRadius.circular(50),
                      nullArtworkWidget: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50)),
                        child: Image.asset(
                          'assets/musify.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    title: SingleChildScrollView(
                      child: Text(
                        another[index].songname!,
                        style: const TextStyle(
                            fontSize: 13.43,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                );
              }),
            ),
    );
  }

  void updateList(String value) {
    setState(() {
      another = dbSongs
          .where((element) =>
              element.songname!.toLowerCase().contains(value.toLowerCase()))
          .toList();
      allSongs.clear();
      for (var item in another) {
        allSongs.add(
          Audio.file(
            item.songurl.toString(),
            metas: Metas(
              artist: item.artist,
              title: item.songname,
              id: item.id.toString(),
            ),
          ),
        );
      }
    });
  }
}
