import 'package:flutter/material.dart';
import 'package:musik/widgets/FloatingControler.dart';
import 'package:musik/widgets/Playlists.dart';
import 'package:musik/widgets/playlists/playlistScreen.dart';

class Playlists extends StatelessWidget {
  const Playlists({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: playLists(),
    );
  }
}
