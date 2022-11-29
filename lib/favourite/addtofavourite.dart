// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:musik/model/dbfunctions.dart';
import 'package:musik/model/favouriteModel.dart';
import 'package:musik/model/songModel.dart';

class addToFavourite extends StatefulWidget {
  int index;
  addToFavourite({super.key, required this.index});

  @override
  State<addToFavourite> createState() => _addToFavouriteState();
}

class _addToFavouriteState extends State<addToFavourite> {
  List<favsongs> fav = [];
  bool favourited = false;
  final box = SongBox.getInstance();
  late List<Songs> dbsongs;
  @override
  void initState() {
    // TODO: implement initState
    dbsongs = box.values.toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    fav = favsongsdb.values.toList();
    return fav
            .where(
                (element) => element.songname == dbsongs[widget.index].songname)
            .isEmpty
        ? TextButton(
            onPressed: () {
              favsongsdb.add(favsongs(
                  songname: dbsongs[widget.index].songname,
                  artist: dbsongs[widget.index].artist,
                  duration: dbsongs[widget.index].duration,
                  songurl: dbsongs[widget.index].songurl,
                  id: dbsongs[widget.index].id));
              setState(() {});
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Added to favourites")));
            },
            child: const Text("Add to favourites",
                style:
                    TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)))
        : TextButton(
            onPressed: () async {
              if (favsongsdb.length < 1) {
                favsongsdb.clear();
                setState(() {});
              } else {
                int currentIndex = fav.indexWhere(
                    (element) => element.id == dbsongs[widget.index].id);
                await favsongsdb.deleteAt(currentIndex);
                setState(() {});
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Removed from favourites")));
              }
            },
            child: const Text("Remove from the Favourite",
                style: TextStyle(
                    color: Colors.grey, fontWeight: FontWeight.bold)));
  }
}
