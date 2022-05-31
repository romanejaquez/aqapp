import 'package:aqapp/helpers/aqcolors.dart';
import 'package:aqapp/helpers/utils.dart';
import 'package:aqapp/models/airqualitystyles.dart';
import 'package:flutter/material.dart';

class AirQualityLoadingData extends StatelessWidget {
  const AirQualityLoadingData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    AirQualityStyles aqStyles = Utils.airQualityStyles[Utils.getDeviceType(context)] as AirQualityStyles;
    
    return Align(
      alignment: aqStyles.loadingAlignment,
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 2,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children:  const [
            Text('Loading Air Quality Data...',
              textAlign: TextAlign.center,
              style: TextStyle(color: AQColors.mainBlue)
            ),
            SizedBox(height: 20),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(AQColors.mainBlue),
            )
          ],
        ),
      ),
    );
  }
}