import 'package:aqapp/services/airqualitycityservice.dart';
import 'package:aqapp/services/airqualitypanelservice.dart';
import 'package:aqapp/services/airqualitystateservice.dart';
import 'package:aqapp/pages/splash.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AirQualityStateService(),
        ),
        ChangeNotifierProvider(
          create: (_) => AirQualityCityService(),
        ),
        ChangeNotifierProvider(
          create: (_) => AirQualityPanelService(),
        )
      ],
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: 'Product Sans Regular'
        ),
        debugShowCheckedModeBanner: false,
        home: const SplashPage()
      )
    )
  );
}