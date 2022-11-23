import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:musik/screens/BottomNavbar.dart';
import 'package:on_audio_query/on_audio_query.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 5)).then((value) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: ((ctx) => BottomNavbar())));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SizedBox(
          width: double.infinity,
          child: Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                SizedBox(
                  height: 90,
                ),
                Image(
                  image: AssetImage("assets/logo.jpg"),
                  width: 150,
                ),
                SpinKitThreeBounce(
                  color: Color.fromARGB(255, 87, 87, 87),
                  size: 30.0,
                ),
              ],
            ),
          ),
        ));
  }
}
