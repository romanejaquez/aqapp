import 'package:aqapp/helpers/aqcolors.dart';
import 'package:aqapp/services/airqualitycityservice.dart';
import 'package:aqapp/services/airqualitypanelservice.dart';
import 'package:aqapp/services/airqualitystateservice.dart';
import 'package:aqapp/widgets/aqroundbutton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectCityModal extends StatefulWidget {
  const SelectCityModal({Key? key}) : super(key: key);

  @override
  State<SelectCityModal> createState() => _SelectCityModalState();
}

class _SelectCityModalState extends State<SelectCityModal> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(20),
        width: 400,
        height: 400,
        child: Column(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // country
                  Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: const [
                        Text('Select your Country'),
                        Text('USA', style: TextStyle(color: AQColors.mainBlue, fontSize: 20))
                      ],
                    ),
                  ),
            
                  // state
                  Consumer<AirQualityStateService>(
                    builder: (context, stateService, child) {
                      return FutureBuilder(
                        future: stateService.getStatesByCountry(),
                        builder: (context, snapshot) {

                          if (!snapshot.hasData) {
                            return const SizedBox(
                                width: 30,
                                height: 30,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(AQColors.mainBlue),
                                )
                              );
                          }

                          List<String> stateItems = snapshot.data as List<String>;
                          
                          return Container(
                            margin: const EdgeInsets.only(top: 10, bottom: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Select your State'),
                                DropdownButton<String>(
                                  isExpanded: true,
                                  value: stateService.selectedState,
                                  items: stateItems.map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value)
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    if (stateService.selectedState != newValue!) {
                                      stateService.selectedState = newValue;

                                      var cityService = Provider.of<AirQualityCityService>(context, listen: false);
                                      cityService.showDropdown = true;
                                      cityService.selectedCity = "--";
                                    }
                                  }
                                )
                              ],
                            ),
                          );
                        },
                      );
                    }
                  ),

                  // city
                  Consumer<AirQualityCityService>(
                    builder: (context, service, child) {

                      if (!service.showDropdown) {
                          return const SizedBox();
                      }

                      return FutureBuilder(
                        future: service.getCitiesByStateAndCountry(context),
                        builder: (context, snapshot) {

                          if (!snapshot.hasData) {
                            return const SizedBox(
                              width: 30,
                              height: 30,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(AQColors.mainBlue),
                              )
                            );
                          }

                          List<String> cityItems = snapshot.data as List<String>;
                          
                          return Container(
                            margin: const EdgeInsets.only(top: 10, bottom: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Select your City'),
                                DropdownButton<String>(
                                  isExpanded: true,
                                  value: service.selectedCity,
                                  items: cityItems.map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value)
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    if (service.selectedCity != newValue!) {
                                      service.selectedCity = newValue;
                                    }
                                  }
                                )
                              ],
                            ),
                          );
                        },
                      );
                    }
                  ),
                ],
              ),
            ),
            Consumer<AirQualityStateService>(
              builder: (context, aqs, child) {
                return Consumer<AirQualityCityService>(
                  builder: (context, aqc, child) {
                    return Opacity(
                      opacity: aqs.selectedState != '--' && aqc.selectedCity != '--' ? 1 : 0.2,
                      child: AQRoundButton(
                        onTap: () {
                          AirQualityPanelService aqpService = Provider.of<AirQualityPanelService>(context, listen: false);
                          aqpService.setCityAndState(aqc.selectedCity, aqs.selectedState);
                          Navigator.of(context).pop();
                        },
                        label: 'Get Air Quality'
                      )
                    );
                  }
                );
              },
            )
          ],
        )
      ),
    );
  }
}