import 'dart:async';

import 'package:aqapp/helpers/aqcolors.dart';
import 'package:aqapp/helpers/aqiconfonts.dart';
import 'package:aqapp/pages/airqualitymainapp.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  late Timer timer;

  @override
  void initState() {
    super.initState();

    timer = Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const AirQualityMainApp())
      );
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AQColors.mainBlue,
      body: Stack(
        children: [
          const Center(
            child: Icon(AQIconFonts.mainLogo, color: Colors.white, size: 60),
          ),
          Center(
            child: SizedBox(
              width: 140,
              height: 140,
              child: CircularProgressIndicator(
                strokeWidth: 10,
                valueColor: AlwaysStoppedAnimation(Colors.white.withOpacity(0.5)),
              )
            ),
          )
        ],
      )
    );
  }
}