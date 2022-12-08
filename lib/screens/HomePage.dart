import 'package:flutter/material.dart';
import 'package:musik/screens/searchScreen.dart';
import 'package:musik/widgets/Cards.dart';
import 'package:musik/widgets/SearchBar.dart';
import 'package:musik/widgets/TitleWidget.dart';
import 'package:musik/widgets/allSongs.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool mp = false;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: Container(
            decoration: const BoxDecoration(color: Colors.black),
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.050,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BannerWidget(),
                      SizedBox(
                        width: width * .10,
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ScreenSearch()));
                          },
                          icon: Icon(
                            Icons.search,
                            size: 30,
                            color: Colors.white,
                          ))
                    ],
                  ),
                ),
              ],
            )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: Column(
            children: [Cards(), allSongsScreen(), endsongs(width)],
          ),
        ),
      ),
    );
  }

  void toast(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(text),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    ));
  }

  SizedBox endsongs(double width) {
    return SizedBox(
        height: 100,
        width: width,
        child: Align(
          alignment: Alignment.topCenter,
          child: Text("End of songs...",
              style: const TextStyle(color: Colors.grey)),
        ));
  }
}
