import 'package:flutter/material.dart';
import 'package:musik/widgets/Favourites.dart';

import '../widgets/FloatingControler.dart';

class Favourites extends StatelessWidget {
  const Favourites({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Row(
            children: const [
              Text(
                "F",
                style: TextStyle(
                    fontFamily: "Inter",
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                    fontSize: 25),
              ),
              Text(
                "avourites",
                style: TextStyle(
                    fontFamily: "Inter",
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
            ],
          ),
          backgroundColor: Colors.black,
        ),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FavSongs(),
            ),
            Positioned(
              top: 585,
              child: FloatingController(),
            )
          ],
        ));
  }
}
