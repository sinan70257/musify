import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:musik/screens/searchScreen.dart';
import 'package:musik/widgets/FloatingControler.dart';
import 'package:musik/widgets/playlists/playlistScreen.dart';
import 'HomePage.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'Playlists.dart';
import 'Settings.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

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
      bottomSheet: FloatingController(),
      body: widget.pages[widget.currentIndex],
      bottomNavigationBar: BottomNavyBar(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

        containerHeight: 60,
        selectedIndex: widget.currentIndex,
        showElevation: true,
        itemCornerRadius: 10,
        curve: Curves.bounceInOut,
        backgroundColor: Colors.black,
        onItemSelected: (newCurrentIndex) {
          setState(() {
            widget.currentIndex = newCurrentIndex;
          });
        },
        // currentIndex: widget.currentIndex,
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            activeColor: Colors.white,
            inactiveColor: Colors.grey,
            textAlign: TextAlign.center,
            icon: Icon(
              Icons.home_filled,
              size: 30,
            ),
            title: Text(
              "Home",
              style: TextStyle(color: Colors.white),
            ),
          ),
          BottomNavyBarItem(
            activeColor: Colors.white,
            inactiveColor: Colors.grey,
            textAlign: TextAlign.center,
            icon: Icon(
              Icons.playlist_add,
              size: 30,
            ),
            title: Text(
              'Playlists',
              style: TextStyle(color: Colors.white),
            ),
          ),
          BottomNavyBarItem(
              activeColor: Colors.white,
              inactiveColor: Colors.grey,
              textAlign: TextAlign.center,
              icon: Icon(
                Icons.settings,
                size: 30,
              ),
              title: Text(
                'Settings',
                style: TextStyle(color: Colors.white),
              )),
        ],
      ),
    );
  }
}
