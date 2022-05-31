import 'package:aqapp/helpers/aqcolors.dart';
import 'package:flutter/material.dart';

class AirQualityLoadingData extends StatelessWidget {
  const AirQualityLoadingData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 2,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const  [
            Text('Loading Air Quality Data...',
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