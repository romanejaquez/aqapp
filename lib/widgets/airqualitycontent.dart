import 'package:aqapp/helpers/aqcolors.dart';
import 'package:aqapp/helpers/aqiconfonts.dart';
import 'package:aqapp/helpers/utils.dart';
import 'package:aqapp/widgets/aqroundbutton.dart';
import 'package:aqapp/widgets/selectcitymodal.dart';
import 'package:flutter/material.dart';

class AirQualityContent extends StatefulWidget {
  const AirQualityContent({Key? key}) : super(key: key);

  @override
  State<AirQualityContent> createState() => _AirQualityContentState();
}

class _AirQualityContentState extends State<AirQualityContent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(60),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Los Angeles,', style: TextStyle(color: AQColors.mainBlue, fontSize: 30, fontWeight: FontWeight.bold)),
          Text('California', style: TextStyle(color: AQColors.mainBlue, fontSize: 40, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Row(
            children: [
              Icon(Icons.air, size: 160, color: AQColors.mainBlue),
              SizedBox(width: 20),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('90', style: TextStyle(fontSize: 120, color: Colors.black, fontWeight: FontWeight.bold)),
                  Row(
                    children: [
                      Text('Air Quality', style: TextStyle(fontSize: 30, color: Colors.grey, fontWeight: FontWeight.bold)),
                      SizedBox(width: 10),
                      Icon(Icons.info_outline, size: 30, color: Colors.grey)
                    ],
                  )
                ],
              )
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Icon(AQIconFonts.storm, color: AQColors.mainGreen, size: 40),
              SizedBox(width: 10),
              Text.rich(
                TextSpan(
                  style: TextStyle(color: AQColors.mainGreen),
                  children: [
                    TextSpan(text: '73', style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold)),
                    TextSpan(text: 'F', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                  ]
                )
              ),
              AQRoundButton(
                onTap: () {
                  Utils.showModal(context, SelectCityModal());
                },
                label: 'Select your City',
                margin: const EdgeInsets.only(left: 50),
              )
            ],
          ),
          SizedBox(height: 20),
          SizedBox(
            width: 150,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(child: Text('Humidity', style: TextStyle(color: AQColors.mainGreen, fontSize: 15))),
                    Text('62%', style: TextStyle(color: AQColors.mainGreen, fontSize: 15)) 
                  ],
                ),
                Row(
                  children: [
                    Expanded(child: Text('Wind Speed', style: TextStyle(color: AQColors.mainGreen, fontSize: 15))),
                    Text('3 m/s', style: TextStyle(color: AQColors.mainGreen, fontSize: 15)) 
                  ],
                )          
              ],
            ),
          )
        ],
      )
    );
  }
}