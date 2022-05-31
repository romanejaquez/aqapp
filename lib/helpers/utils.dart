import 'package:aqapp/helpers/aqiconfonts.dart';
import 'package:aqapp/helpers/devicebreakpoints.dart';
import 'package:aqapp/models/airqualitystyles.dart';
import 'package:flutter/material.dart';

class Utils {

  static const int mobileMaxWidth = 550;
  static const int tabletMaxWidth = 768;
  static const int laptopMaxWidth = 1024;

  static Map<DeviceBreakpoints, AirQualityStyles> airQualityStyles = {
    DeviceBreakpoints.mobile: AirQualityStyles(
      windmill1Size: 0.6,
      windmill2Size: 1.0,
      windmill1Visible: true,
      windmill2Visible: false,
      windmill1Position: -120,
      windmill1Opacity: 0.5,
      treesSize: 0.4,
      treesPosition: -50,
      sunSize: 0.5,
      smallTreeVisible: false,
      aqContentPadding: 40,
      aqMainIcon: 80,
      selectButtonHoriz: false,
      cloudsmSize: 50,
      cloudmdSize: 150,
      cloudlgSize: 250,
      loadingAlignment: Alignment.center,
    ),
    DeviceBreakpoints.tablet: AirQualityStyles(
      windmill1Size: 0.7,
      windmill2Size: 0.5,
      windmill1Visible: true,
      windmill2Visible: false,
      windmill1Position: -50,
      windmill1Opacity: 1,
      treesSize: 0.5,
      treesPosition: 0,
      sunSize: 0.6,
      smallTreeVisible: true,
      aqContentPadding: 80,
      aqMainIcon: 100,
      selectButtonHoriz: true,
      cloudsmSize: 100,
      cloudmdSize: 200,
      cloudlgSize: 300,
      loadingAlignment: Alignment.centerLeft,
    ),
    DeviceBreakpoints.laptop: AirQualityStyles(
      windmill1Size: 1.0,
      windmill2Size: 0.7,
      windmill1Visible: true,
      windmill2Visible: true,
      windmill1Position: 200,
      windmill1Opacity: 1,
      treesSize: 0.7,
      treesPosition: 0,
      sunSize: 1.0,
      smallTreeVisible: true,
      aqContentPadding: 80,
      aqMainIcon: 160,
      selectButtonHoriz: true,
      cloudsmSize: 150,
      cloudmdSize: 250,
      cloudlgSize: 350,
      loadingAlignment: Alignment.centerLeft,
    )
  };

  static void showModal(BuildContext context, Widget widget, {bool dismiss = true }) {
    showDialog(context: context,
      barrierDismissible: dismiss,
      builder: (BuildContext cxt) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        content: widget
      );
    });
  }

  static DeviceBreakpoints getDeviceType(BuildContext context) {

    MediaQueryData data = MediaQuery.of(context);
    DeviceBreakpoints bk = DeviceBreakpoints.mobile;

    if (data.size.width > Utils.mobileMaxWidth 
      && data.size.width <= Utils.tabletMaxWidth) {
      bk = DeviceBreakpoints.tablet;
    }

    else if (data.size.width > Utils.tabletMaxWidth) {
      bk = DeviceBreakpoints.laptop;
    }

    return bk;
  }

  static IconData getWeatherIconFromString(String iconValue) {
    
    IconData? icon;

    switch(iconValue) {
      case '01d':
        icon = AQIconFonts.iconSunny;
        break;
      case '01n':
        icon = AQIconFonts.iconClearNight;
        break;
      case '02d':
        icon = AQIconFonts.iconSunny;
        break;
      case '02n':
        icon = AQIconFonts.iconCloudyNight;
        break;
      case '03d':
        icon = AQIconFonts.iconSingleCloud;
        break;
      case '04d':
        icon = AQIconFonts.iconMultiCloud;
        break;
      case '09d':
        icon = AQIconFonts.iconThunderstorm;
        break;
      case '10d':
        icon = AQIconFonts.iconRain;
        break;
      case '10n':
        icon = AQIconFonts.iconRain;
        break;
      case '11d':
        icon = AQIconFonts.iconThunderstorm;
        break;
      case '13d':
        icon = AQIconFonts.iconSnowy;
        break;
      case '50d':
        icon = AQIconFonts.iconWindy;
        break;
    }

    return icon!;
  }
}
