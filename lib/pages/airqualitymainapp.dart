import 'package:aqapp/helpers/utils.dart';
import 'package:aqapp/models/airqualitystyles.dart';
import 'package:aqapp/widgets/airqualitycontent.dart';
import 'package:aqapp/widgets/clouds.dart';
import 'package:aqapp/widgets/sun.dart';
import 'package:aqapp/widgets/trees.dart';
import 'package:aqapp/widgets/windmill.dart';
import 'package:flutter/material.dart';

class AirQualityMainApp extends StatelessWidget {
  const AirQualityMainApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    AirQualityStyles aqStyles = Utils.airQualityStyles[Utils.getDeviceType(context)] as AirQualityStyles;
    
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // sun
          Positioned(
            top: 20,
            right: 20,
            child: Transform.scale(
              alignment: Alignment.topRight,
              scale: aqStyles.sunSize,
              child: Sun()
            )
          ),
          
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
              scale: aqStyles.windmill2Size,
              child: Visibility(
                visible: aqStyles.windmill2Visible,
                child: const Opacity(
                  opacity: 0.5,
                  child: Windmill(speed: 5)
                ),
              )
            )
          ),
          Positioned(
            right: aqStyles.windmill1Position,
            bottom: 0,
            child: Transform.scale(
              alignment: Alignment.bottomCenter,
              scale: aqStyles.windmill1Size,
              child: Visibility(
                visible: aqStyles.windmill1Visible,
                child: Opacity(
                  opacity: aqStyles.windmill1Opacity,
                  child: const Windmill(speed: 15))
              )
            )
          ),
          
          // trees
          Positioned(
            bottom: 0,
            left: aqStyles.treesPosition,
            right: 0,
            top: 0,
            child: Transform.scale(
              scale: aqStyles.treesSize,
              alignment: Alignment.bottomLeft,
              child: Trees(),
            ),
          ),
        
          // content
          const Align(
            alignment: Alignment.topLeft,
            child: AirQualityContent()
          )
        ],
      )
    );
  }
}
