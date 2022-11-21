import 'package:flutter/material.dart';
import 'package:musik/screens/Favourites.dart';
import 'package:musik/widgets/AlbumArt.dart';

class homeCards extends StatelessWidget {
  const homeCards({
    Key? key,
    required this.path,
    required this.name,
    required this.no,
  }) : super(key: key);
  final String path;
  final String name;
  final int no;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: ((context) => Favourites())));
      },
      child: AlbumArt(
        imageName: path,
        head: name,
        song: no,
      ),
    );
  }
}
