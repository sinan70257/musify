// ignore: file_names
import 'package:flutter/material.dart';
import 'package:musik/screens/playlist_screen/widgets/playlistScreen.dart';

class Playlists extends StatelessWidget {
  const Playlists({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: playLists(),
    );
  }
}
