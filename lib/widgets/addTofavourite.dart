// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:musik/model/dbfunctions.dart';
import 'package:musik/model/favouriteModel.dart';
import 'package:musik/model/songModel.dart';

// ignore: must_be_immutable, camel_case_types
class addToFav extends StatefulWidget {
  int index;
  addToFav({super.key, required this.index});

  @override
  State<addToFav> createState() => _addToFavState();
}

class _addToFavState extends State<addToFav> {
  List<favsongs> fav = [];
  bool favourited = false;
  final box = SongBox.getInstance();
  late List<Songs> dbsongs = box.values.toList();

  @override
  void initState() {
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
        ? IconButton(
            onPressed: () {
              setState(() {
                favsongsdb.add(favsongs(
                    songname: dbsongs[widget.index].songname,
                    artist: dbsongs[widget.index].artist,
                    duration: dbsongs[widget.index].duration,
                    songurl: dbsongs[widget.index].songurl,
                    id: dbsongs[widget.index].id));
              });
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                duration: Duration(seconds: 1),
                behavior: SnackBarBehavior.floating,
                content: Text("Added to favourites"),
              ));
            },
            icon: const Icon(
              Icons.favorite_border,
              color: Colors.white,
            ))
        : IconButton(
            onPressed: () async {
              if (favsongsdb.length < 1) {
                favsongsdb.clear();
                setState(() {});
              } else {
                int currentindex = fav.indexWhere(
                    (element) => element.id == dbsongs[widget.index].id);
                await favsongsdb.deleteAt(currentindex);
                setState(() {});
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    behavior: SnackBarBehavior.floating,
                    duration: Duration(seconds: 1),
                    content: Text("Removed from favourites")));
              }
            },
            icon: const Icon(
              Icons.favorite,
              color: Colors.white,
            ));
  }
}
