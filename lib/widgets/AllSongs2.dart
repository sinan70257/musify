import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:musik/model/songModel.dart';
import 'package:musik/screens/NowPlaying.dart';
import 'package:musik/screens/nowPlaying2.dart';

class AllSongs extends StatefulWidget {
  const AllSongs({super.key});

  @override
  State<AllSongs> createState() => _AllSongsState();
}

class _AllSongsState extends State<AllSongs> {
  late bool toggle = false;
  late bool playervisibility;
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        const Text(
          "All Songs",
          style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontFamily: "Inter",
              fontWeight: FontWeight.w900),
        ),
        ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 50,
            padding: EdgeInsets.only(top: 10),
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  ListTile(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: ((context) => NowPlaying2())));
                    },
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.asset(
                          'assets/images/The_Weeknd_-_After_Hours.png'),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.playlist_add,
                                  color: Colors.white,
                                  size: 30,
                                ))),
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
                      "The Weeknd",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Inter",
                      ),
                    ),
                    title: Text(
                      "Save Your Tears",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  )
                ],
              );
            }),
      ],
    );
  }
}
