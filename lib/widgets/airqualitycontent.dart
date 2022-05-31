import 'package:aqapp/helpers/aqcolors.dart';
import 'package:aqapp/helpers/aqiconfonts.dart';
import 'package:aqapp/helpers/utils.dart';
import 'package:aqapp/models/airquality.model.dart';
import 'package:aqapp/services/airqualitypanelservice.dart';
import 'package:aqapp/widgets/airqualityloadingdata.dart';
import 'package:aqapp/widgets/aqroundbutton.dart';
import 'package:aqapp/widgets/selectcitymodal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AirQualityContent extends StatefulWidget {
  const AirQualityContent({Key? key}) : super(key: key);

  @override
  State<AirQualityContent> createState() => _AirQualityContentState();
}

class _AirQualityContentState extends State<AirQualityContent> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AirQualityPanelService>(
      builder: (context, service, child) {

        return FutureBuilder(
          future: service.getAirQuality(),
          builder: (context, snapshot) {

            if (!snapshot.hasData || snapshot.connectionState == ConnectionState.waiting) {
              return const AirQualityLoadingData();
            }

            AirQualityModel aqModel = snapshot.data as AirQualityModel;

            return Padding(
              padding: const EdgeInsets.all(80),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${aqModel.city},', style: const TextStyle(color: AQColors.mainBlue, fontSize: 30, fontWeight: FontWeight.bold)),
                  Text(aqModel.state, style: const TextStyle(color: AQColors.mainBlue, fontSize: 40, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(Icons.air, size: 160, color: AQColors.mainBlue),
                      const SizedBox(width: 20),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(aqModel.airQuality.toString(), style: const TextStyle(fontSize: 120, color: Colors.black, fontWeight: FontWeight.bold)),
                          Row(
                            children: const [
                              Text('Air Quality', style: TextStyle(fontSize: 30, color: Colors.grey, fontWeight: FontWeight.bold)),
                              SizedBox(width: 10),
                              Icon(Icons.info_outline, size: 30, color: Colors.grey)
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      const Icon(AQIconFonts.storm, color: AQColors.mainGreen, size: 40),
                      const SizedBox(width: 10),
                      Text.rich(
                        TextSpan(
                          style: const TextStyle(color: AQColors.mainGreen),
                          children: [
                            TextSpan(text: aqModel.temp.toString(), style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold)),
                            const TextSpan(text: ' C', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                          ]
                        )
                      ),
                      AQRoundButton(
                        onTap: () {
                          Utils.showModal(context, const SelectCityModal());
                        },
                        label: 'Select your City',
                        margin: const EdgeInsets.only(left: 50),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 150,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Expanded(child: Text('Humidity', style: TextStyle(color: AQColors.mainGreen, fontSize: 15))),
                            Text('${aqModel.humidity}%', style: const TextStyle(color: AQColors.mainGreen, fontSize: 15)) 
                          ],
                        ),
                        Row(
                          children: [
                            const Expanded(child: Text('Wind Speed', style: TextStyle(color: AQColors.mainGreen, fontSize: 15))),
                            Text('${aqModel.windSpeed} m/s', style: const TextStyle(color: AQColors.mainGreen, fontSize: 15)) 
                          ],
                        )          
                      ],
                    ),
                  )
                ],
              )
            );
          }
        );
      },
    );
  }
}