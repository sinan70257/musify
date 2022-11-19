import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:musik/screens/SplashScreen.dart';
import 'package:audioplayers/audioplayers.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.black),
      home: Splash(),
    );
  }
}
