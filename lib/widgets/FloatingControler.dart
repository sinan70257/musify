import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:musik/screens/NowPlaying.dart';

class FloatingController extends StatefulWidget {
  const FloatingController({super.key});

  @override
  State<FloatingController> createState() => _FloatingControllerState();
}

class _FloatingControllerState extends State<FloatingController>
    with SingleTickerProviderStateMixin {
  // AssetsAudioPlayer player = AssetsAudioPlayer();
  // late AnimationController _animationController;

  // bool isPlaying = false;
  // @override
  // void initState() {
  //   super.initState();
  //   player.open(
  //       Audio(
  //           "assets/audio/X2Download.app - The Weeknd - Save Your Tears (Official Music Video) (128 kbps).mp3"),
  //       autoStart: false,
  //       showNotification: true);
  //   _animationController =
  //       AnimationController(vsync: this, duration: Duration(milliseconds: 450));
  // }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: ((context) => NowPlaying())));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 96, 96, 96),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        height: 80,
        width: 392,
        child: Center(
          child: ListTile(
            leading: ClipRRect(
              child: Image.asset("assets/images/The_Weeknd_-_After_Hours.png"),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            title: Text(
              "Save Your Tears",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w900,
                  color: Colors.white),
            ),
            subtitle: Text(
              "The Weeknd",
              style: TextStyle(
                  fontFamily: "Inter",
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 180, 179, 179)),
            ),
            trailing: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.skip_previous,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                  // Container(
                  //   child: IconButton(
                  //       // splashColor: Colors.lightGreenAccent,
                  //       iconSize: 40,
                  //       onPressed: () => _handleOnPress(),
                  //       icon: AnimatedIcon(
                  //           color: Colors.white,
                  //           // size: 50,
                  //           icon: AnimatedIcons.play_pause,
                  //           progress: _animationController)),
                  // ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.skip_next,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // void _handleOnPress() {
  //   setState(() {
  //     isPlaying = !isPlaying;
  //     if (isPlaying) {
  //       _animationController.forward();
  //       player.play();
  //     } else {
  //       _animationController.reverse();
  //       player.pause();
  //     }
  //   });
  // }
}
