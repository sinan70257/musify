import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:musik/widgets/NowPlayingClip.dart';

class NowPlaying extends StatelessWidget {
  const NowPlaying({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text(
          "Now Playing",
          style: TextStyle(
              color: Colors.white,
              fontFamily: "Inter",
              fontWeight: FontWeight.bold,
              fontSize: 25),
        ),
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            NowPlayingClip()
          ],
        ),
      ),
    );
  }
}
