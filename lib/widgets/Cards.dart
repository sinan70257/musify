import 'package:flutter/material.dart';
import 'package:musik/screens/Favourites.dart';
import 'package:musik/screens/Playlists.dart';
import 'package:musik/widgets/AlbumArt.dart';

class Cards extends StatelessWidget {
  const Cards({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: ((context) => Playlists())));
            },
            child: AlbumArt(
              imageName: "assets/images/The_Weeknd_-_After_Hours.png",
              head: "My Playlist",
              song: 22,
            ),
          )
        ],
      ),
    );
  }
}
