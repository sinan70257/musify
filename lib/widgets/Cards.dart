import 'package:flutter/material.dart';
import 'package:musik/screens/Favourites.dart';
import 'package:musik/screens/Playlists.dart';
import 'package:musik/widgets/AlbumArt.dart';

class Cards extends StatelessWidget {
  const Cards({super.key});

  @override
  Widget build(BuildContext context) {
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
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: ((context) => Favourites())));
                },
                child: const AlbumArt(
                  imageName: "assets/images/Cs47zArVYAAg5dS.jpg",
                  head: "Favourites",
                  song: 10,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: ((context) => Playlists())));
                },
                child: AlbumArt(
                  imageName:
                      "assets/images/4455a314edfff1a63c30f03d9d135c64.1000x1000x1.jpg",
                  head: "Most Played",
                  song: 0,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: ((context) => Playlists())));
                },
                child: AlbumArt(
                  imageName: "assets/images/The_Weeknd_-_After_Hours.png",
                  head: "Recent Played",
                  song: 0,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
