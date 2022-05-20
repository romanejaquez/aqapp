import 'package:aqapp/widgets/clouds.dart';
import 'package:aqapp/widgets/sun.dart';
import 'package:aqapp/widgets/trees.dart';
import 'package:aqapp/widgets/windmill.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // clouds
          const Positioned.fill(
            child: Clouds()
          ),

          // windmills
          Positioned(
            right: 0,
            bottom: 0,
            child: Transform.scale(
              alignment: Alignment.bottomCenter,
              scale: 0.7,
              child: const Opacity(
                opacity: 0.5,
                child: Windmill(speed: 5)
              )
            )
          ),
          const Positioned(
            right: 200,
            bottom: 0,
            child: Windmill(speed: 15)
          ),
          
          // trees
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            top: 0,
            child: Transform.scale(
              scale: 0.7,
              alignment: Alignment.bottomLeft,
              child: Trees(),
            ),
          ),

          // sun
          Positioned(
            top: 20,
            right: 20,
            child: Sun()
          ),

          
        ],
      )
    );
  }
}
