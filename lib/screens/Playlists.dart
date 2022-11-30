import 'package:flutter/material.dart';
import 'package:musik/widgets/FloatingControler.dart';
import 'package:musik/widgets/Playlists.dart';

class Playlists extends StatelessWidget {
  const Playlists({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          children: const [
            Text(
              "P",
              style: TextStyle(
                  fontFamily: "Inter",
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
            Text(
              "laylist",
              style: TextStyle(
                  fontFamily: "Inter",
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
          ],
        ),
        actions: [
          Row(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.add,
                    size: 35,
                  )),
              IconButton(onPressed: () {}, icon: Icon(Icons.edit))
            ],
          )
        ],
      ),
      // bottomSheet: FloatingController(),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              PlayslistSongs(),
            ],
          ),
        ),
      ),
    );
  }
}
