import 'package:flutter/material.dart';
import 'package:musik/screens/HomePage.dart';
import 'package:musik/screens/Playlists.dart';
import 'package:musik/screens/Settings.dart';

// ignore: must_be_immutable
class BottomNavbar extends StatefulWidget {
  BottomNavbar({super.key});
  int currentIndex = 0;
  List pages = const [
    HomePage(),
    Playlists(),
    Settings(),
  ];

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.pages[widget.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.white,
        selectedIconTheme: IconThemeData(color: Colors.white),
        onTap: (newCurrentIndex) {
          setState(() {
            widget.currentIndex = newCurrentIndex;
          });
        },
        currentIndex: widget.currentIndex,
        backgroundColor: Colors.black,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_filled,
              size: 30,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.playlist_add,
              size: 30,
            ),
            label: 'Playlists',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
              size: 30,
            ),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
