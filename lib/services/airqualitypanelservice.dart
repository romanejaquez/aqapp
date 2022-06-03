import 'package:aqapp/models/airquality.model.dart';
import 'package:aqapp/services/proxyservice.dart';
import 'package:flutter/material.dart';

class AirQualityPanelService extends ChangeNotifier {

  String selectedCity = 'Los Angeles';
  String selectedState = 'California';
  String selectedCountry = 'USA';

  void setCityAndState(String city, String state) {
    selectedCity = city;
    selectedState = state;
    notifyListeners();
  }

  Future<AirQualityModel> getAirQuality() {
    return ProxyService.getAirQuality(selectedCountry, selectedState, selectedCity);
  }
}