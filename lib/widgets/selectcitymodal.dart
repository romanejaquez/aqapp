import 'package:aqapp/widgets/aqroundbutton.dart';
import 'package:flutter/material.dart';

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
                children: [
                  // country
                  Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Select your Country'),
                        DropdownButton<String>(
                          isExpanded: true,
                          value: selectedCountry,
                          items: <String>['--', 'USA', 'Algeria', 'Puerto Rico'].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value)
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedCountry = newValue!;
                            });
                          }
                        )
                      ],
                    ),
                  ),
            
                  // state
                  Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Select your State'),
                        DropdownButton<String>(
                          isExpanded: true,
                          value: selectedState,
                          items: <String>['--', 'USA', 'Algeria', 'Puerto Rico'].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value)
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedState = newValue!;
                            });
                          }
                        )
                      ],
                    ),
                  ),
            
                  // city
                  Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Select your City'),
                        DropdownButton<String>(
                          isExpanded: true,
                          value: selectedCity,
                          items: <String>['--', 'USA', 'Algeria', 'Puerto Rico'].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value)
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedCity = newValue!;
                            });
                          }
                        )
                      ],
                    ),
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