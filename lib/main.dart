import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:musik/model/dbfunctions.dart';
import 'package:musik/model/favouriteModel.dart';
import 'package:musik/model/mostPlayed.dart';
import 'package:musik/model/playlistmodel.dart';
import 'package:musik/model/recentlyPlayed.dart';
import 'package:musik/model/songModel.dart';
import 'package:musik/screens/SplashScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Hive.initFlutter();

  Hive.registerAdapter(SongsAdapter());
  await Hive.openBox<Songs>(boxname);

  Hive.registerAdapter(favsongsAdapter());
  opendb_fav();

  runApp(const MyApp());
  Hive.registerAdapter(PlaylistSongsAdapter());
  opendatabase();
  Hive.registerAdapter(MostPlayedAdapter());
  openmostplayeddb();
  Hive.registerAdapter(RecentlyPlayedAdapter());
  openrecentlyplayeddb();
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // title: "Musify",
      theme: ThemeData(
        primaryColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

      home: Splash(),
    );
  }
}
