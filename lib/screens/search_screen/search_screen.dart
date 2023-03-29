import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musik/colors/colors.dart';
import 'package:musik/controller/search_controller.dart';
import 'package:musik/model/songModel.dart';
import 'package:musik/screens/nowplaying_screen/now_playing.dart';
import 'package:on_audio_query/on_audio_query.dart';

final TextEditingController searchController = TextEditingController();
final box = SongBox.getInstance();
late List<Songs> SdbSongs;
final AssetsAudioPlayer _audioPlayer = AssetsAudioPlayer.withId('0');
List<Audio> SallSongs = [];

class ScreenSearch extends StatelessWidget {
  ScreenSearch({super.key});

  @override
  late List<Songs> another = List.from(SdbSongs);
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: searchbar(context),
        centerTitle: true,
      ),
      backgroundColor: const Color.fromARGB(255, 21, 21, 21),
      body: SafeArea(
        child: Column(
          children: [
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
    return GetBuilder<SearchController>(
      init: SearchController(),
      initState: (_) {},
      builder: (data) {
        return TextFormField(
          autofocus: true,
          style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
          onTap: () {},
          controller: searchController,
          onChanged: (value) => data.getSearch(value),
          decoration: InputDecoration(
            filled: true,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.grey, width: 2)),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 2)),
            hintText: "Search ",
            hintStyle: const TextStyle(color: Colors.grey),
          ),
        );
      },
    );
  }

  searchHistory() {
    return GetBuilder<SearchController>(
      init: SearchController(),
      initState: (_) {},
      builder: (searchdata) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: searchdata.another.isEmpty
              ? const Center(
                  child: Text(
                  "No Songs Found",
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ))
              : ListView.builder(
                  itemCount: searchdata.another.length,
                  itemBuilder: ((context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: ListTile(
                        onTap: () {
                          _audioPlayer.open(
                              Playlist(audios: SallSongs, startIndex: index),
                              showNotification: notificationStatus,
                              headPhoneStrategy:
                                  HeadPhoneStrategy.pauseOnUnplug,
                              loopMode: LoopMode.playlist);

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: ((context) => NowPlaying2()),
                            ),
                          );
                        },
                        leading: QueryArtworkWidget(
                          artworkHeight: 55,
                          artworkWidth: 55,
                          id: searchdata.another[index].id!,
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
                              'assets/images/musify copy0.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        subtitle: Text(
                          another[index].artist!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontFamily: "Inter",
                          ),
                        ),
                        title: Text(
                          searchdata.another[index].songname!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              color: Colors.white,
                              fontFamily: "Inter",
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    );
                  }),
                ),
        );
      },
    );
  }
}
