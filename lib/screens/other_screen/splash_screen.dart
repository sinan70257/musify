import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:musik/model/dbfunctions.dart';
import 'package:musik/model/mostPlayed.dart';
import 'package:musik/model/songModel.dart';
import 'package:musik/screens/other_screen/bottom_navbar.dart';
import 'package:on_audio_query/on_audio_query.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

final audioquery = OnAudioQuery();
final box = SongBox.getInstance();

List<SongModel> fetchSongs = [];
List<SongModel> allSongs = [];
List<Audio> fullsongs = [];

class _SplashState extends State<Splash> {
  @override
  void initState() {
    requestStoragePermission();

    Future.delayed(const Duration(seconds: 3)).then((value) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: ((ctx) => BottomNavbar())));
    });
    super.initState();
  }

  requestStoragePermission() async {
    bool permissionStatus = await audioquery.permissionsStatus();
    if (!permissionStatus) {
      await audioquery.permissionsRequest();

      fetchSongs = await audioquery.querySongs();
      for (var element in fetchSongs) {
        if (element.fileExtension == "mp3") {
          allSongs.add(element);
        }
      }
      for (var element in allSongs) {
        mostplayedsongs.add(
          MostPlayed(
              songname: element.title,
              songurl: element.uri!,
              duration: element.duration!,
              artist: element.artist!,
              count: 0,
              id: element.id),
        );
      }

      for (var element in allSongs) {
        box.add(Songs(
            songname: element.title,
            artist: element.artist,
            duration: element.duration,
            id: element.id,
            songurl: element.uri));
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              SizedBox(
                height: 70,
              ),
              Image(
                image: AssetImage("assets/logo.jpg"),
                width: 150,
              ),
              SpinKitThreeBounce(
                color: Color.fromARGB(255, 87, 87, 87),
                size: 30.0,
              ),
            ],
          ),
        ));
  }
}
