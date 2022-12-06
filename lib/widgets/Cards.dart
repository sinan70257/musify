import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:musik/model/favouriteModel.dart';
import 'package:musik/screens/Favourites.dart';
import 'package:musik/screens/Playlists.dart';
import 'package:musik/screens/mostlyPlayed.dart';
import 'package:musik/screens/recentlyPlayedScreen.dart';
import 'package:musik/widgets/AlbumArt.dart';

class Cards extends StatelessWidget {
  const Cards({super.key});

  @override
  Widget build(BuildContext context) {
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
                        song: alldbfavsongs.length,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: ((context) => mostlyPlayed())));
                      },
                      child: const AlbumArt(
                        imageName:
                            "assets/images/4455a314edfff1a63c30f03d9d135c64.1000x1000x1.jpg",
                        head: "Most Played",
                        song: 0,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: ((context) => recentlyPlayed())));
                      },
                      child: const AlbumArt(
                        imageName: "assets/images/The_Weeknd_-_After_Hours.jpg",
                        head: "Recent Played",
                        song: 0,
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }));
  }
}
