import 'package:flutter/material.dart';
import 'package:musik/screens/NowPlaying.dart';

class FloatingController extends StatelessWidget {
  const FloatingController({super.key});

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
                mainAxisAlignment: MainAxisAlignment.center,
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
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.play_arrow_rounded,
                        size: 35,
                        color: Color.fromARGB(255, 255, 255, 255),
                      )),
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
}
