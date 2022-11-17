import 'package:flutter/material.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';

class NowPlayingClip extends StatelessWidget {
  const NowPlayingClip({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset("assets/images/The_Weeknd_-_After_Hours.png"),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          "Save Your Tears",
          style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontFamily: "Inter",
              fontWeight: FontWeight.w900),
        ),
        Text(
          "The Weeknd",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 20,
            fontFamily: "Inter",
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.playlist_add,
                  color: Colors.white,
                  size: 30,
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.loop,
                  color: Colors.white,
                  size: 30,
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.shuffle,
                  color: Colors.white,
                  size: 30,
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.favorite_border_outlined,
                  color: Colors.white,
                  size: 30,
                )),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          width: 350,
          child: ProgressBar(
            progressBarColor: Colors.white,
            baseBarColor: Colors.white.withOpacity(0.24),
            bufferedBarColor: Colors.white.withOpacity(0.24),
            thumbColor: Colors.white,
            progress: Duration(milliseconds: 1000),
            // buffered: Duration(milliseconds: 2000),
            // timeLabelLocation: TimeLabelLocation.sides,
            total: Duration(milliseconds: 5000),
            barHeight: 3,
            thumbRadius: 6,
            onSeek: (duration) {
              // print('User selected a new time: $duration');
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 40,
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.skip_previous_rounded,
                  color: Colors.white,
                  size: 40,
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.rotate_left,
                  color: Colors.white,
                )),
            Container(
              height: 80,
              width: 80,
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.play_circle_filled,
                    color: Colors.white,
                    size: 70,
                  )),
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.rotate_right,
                  color: Colors.white,
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.skip_next_rounded,
                  color: Colors.white,
                  size: 40,
                )),
            SizedBox(
              width: 40,
            )
          ],
        )
      ],
    );
  }
}
