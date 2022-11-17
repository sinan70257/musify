import 'package:flutter/material.dart';
import 'package:musik/widgets/AllSongs.dart';
import 'package:musik/widgets/Cards.dart';
import 'package:musik/widgets/SearchBar.dart';
import 'package:musik/widgets/TitleWidget.dart';
import '../widgets/FloatingControler.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120.0),
        child: Container(
            decoration: const BoxDecoration(color: Colors.black),
            child: Column(
              children: const [
                BannerWidget(),
                SearchBar(),
              ],
            )),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 6,
            child: Container(
              // height: 455,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Cards(),
                      AllSongs(),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: FloatingController(),
            ),
          )
        ],
      ),
    );
  }
}
