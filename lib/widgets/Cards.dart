import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:musik/model/dbfunctions.dart';
import 'package:musik/model/favouriteModel.dart';
import 'package:musik/model/mostPlayed.dart';
import 'package:musik/screens/favourite_screen/favourite_screen.dart';
import 'package:musik/screens/playlist_screen/playlists.dart';
import 'package:musik/screens/mostplayed_screen/most_played.dart';
import 'package:musik/screens/recentplayed_screen/recent_played.dart';
import 'package:musik/widgets/albumArt.dart';

class Cards extends StatelessWidget {
  const Cards({super.key});

  @override
  Widget build(BuildContext context) {
    List<MostPlayed> finalpmsongs = [];
    return ValueListenableBuilder<Box<favsongs>>(
      valueListenable: Hive.box<favsongs>('favsongs').listenable(),
      builder: ((context, Box<favsongs> alldbfavsongs, child) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SizedBox(
              width: 650,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: ((context) => Favourites())));
                    },
                    child: AlbumArt(
                      imageName: "assets/images/Cs47zArVYAAg5dS.jpg",
                      head: "Favourites",
                      song: alldbfavsongs.length.toString(),
                    ),
                  ),
                  ValueListenableBuilder<Box<MostPlayed>>(
                      valueListenable:
                          Hive.box<MostPlayed>('mostplayed').listenable(),
                      builder: (context, Box<MostPlayed> mpsongbox, _) {
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: ((context) => mostlyPlayed())));
                          },
                          child: AlbumArt(
                            imageName:
                                "assets/images/4455a314edfff1a63c30f03d9d135c64.1000x1000x1.jpg",
                            head: "Most Played",
                            // song: finalpmsongs.length,
                          ),
                        );
                      }),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: ((context) => recentlyPlayed())));
                    },
                    child: AlbumArt(
                      imageName: "assets/images/The_Weeknd_-_After_Hours.jpg",
                      head: "Recent Played",
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
