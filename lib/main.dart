import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:musik/Bloc/all_songs/allsongs_bloc.dart';
import 'package:musik/Bloc/favourites/favourites_bloc.dart';
import 'package:musik/Bloc/most_played/most_played_bloc.dart';
import 'package:musik/Bloc/now_playing/now_playing_bloc.dart';
import 'package:musik/Bloc/playlist/playlist_bloc.dart';
import 'package:musik/Bloc/recently_played/recently_played_bloc.dart';
import 'package:musik/model/dbfunctions.dart';
import 'package:musik/model/favouriteModel.dart';
import 'package:musik/model/mostPlayed.dart';
import 'package:musik/model/playlistmodel.dart';
import 'package:musik/model/recentlyPlayed.dart';
import 'package:musik/model/songModel.dart';
import 'package:musik/screens/other_screen/splash_screen.dart';

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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MostPlayedBloc>(
          create: (context) => MostPlayedBloc(),
        ),
        BlocProvider<AllsongsBloc>(
          create: (context) => AllsongsBloc(),
        ),
        BlocProvider<RecentlyPlayedBloc>(
          create: (context) => RecentlyPlayedBloc(),
        ),
        BlocProvider(create: (context) => NowPlayingBloc()),
        BlocProvider<FavouritesBloc>(
          create: (context) => FavouritesBloc(),
        ),
        BlocProvider<PlaylistBloc>(
          create: (context) => PlaylistBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.white,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Splash(),
      ),
    );
  }
}
