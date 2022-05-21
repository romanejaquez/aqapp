import 'package:aqapp/helpers/aqcolors.dart';
import 'package:aqapp/services/airqualitycityservice.dart';
import 'package:aqapp/services/airqualitystateservice.dart';
import 'package:aqapp/widgets/aqroundbutton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectCityModal extends StatefulWidget {
  SelectCityModal({Key? key}) : super(key: key);

  @override
  State<SelectCityModal> createState() => _SelectCityModalState();
}

class _SelectCityModalState extends State<SelectCityModal> {

  String selectedCity = '--';
  String selectedState = '--';
  String selectedCountry = '--';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    AirQualityStateService stateService = Provider.of<AirQualityStateService>(context, listen: false);
    AirQualityCityService cityService = Provider.of<AirQualityCityService>(context, listen: false);

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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Select your Country'),
                        Text('USA', style: TextStyle(color: AQColors.mainBlue, fontSize: 20))
                        // DropdownButton<String>(
                        //   isExpanded: true,
                        //   value: selectedCountry,
                        //   items: <String>['--', 'USA', 'Algeria', 'Puerto Rico'].map((String value) {
                        //     return DropdownMenuItem<String>(
                        //       value: value,
                        //       child: Text(value)
                        //     );
                        //   }).toList(),
                        //   onChanged: (String? newValue) {
                        //     setState(() {
                        //       selectedCountry = newValue!;
                        //     });
                        //   }
                        // )
                      ],
                    ),
                  ),
            
                  // state
                  FutureBuilder(
                      future: stateService.getStatesByCountry(),
                      builder: (context, snapshot) {

                        if (!snapshot.hasData) {
                          return Text('fetching data...');
                        }

                        List<String> stateItems = snapshot.data as List<String>;
                        
                        return Container(
                          margin: const EdgeInsets.only(top: 10, bottom: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Select your State'),
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
                                    setState(() {
                                      stateService.selectedState = newValue;

                                      var cityService = Provider.of<AirQualityCityService>(context, listen: false);
                                      cityService.showDropdown = true;
                                    });
                                  }
                                }
                              )
                            ],
                          ),
                        );
                      },
                    ),
            
                  !cityService.showDropdown ? SizedBox() : 
                      FutureBuilder(
                      future: cityService.getCitiesByStateAndCountry(context),
                      builder: (context, snapshot) {

                        if (!snapshot.hasData) {
                          return SizedBox(
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
                                value: cityService.selectedCity,
                                items: cityItems.map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value)
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  if (cityService.selectedCity != newValue!) {
                                    setState(() {
                                      cityService.selectedCity = newValue;
                                    });
                                  }
                                }
                              )
                            ],
                          ),
                        );
                      },
                    )
                ],
              ),
            ),
            AQRoundButton(
              onTap: () {},
              label: 'Get Air Quality Data'
            )
          ],
        )
      ),
    );
  }
}