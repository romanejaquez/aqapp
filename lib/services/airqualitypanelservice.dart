import 'package:aqapp/models/airquality.model.dart';
import 'package:aqapp/services/proxyservice.dart';
import 'package:flutter/material.dart';

class AirQualityPanelService extends ChangeNotifier {

  String selectedCity = 'Prague';
  String selectedState = 'Praha';
  String selectedCountry = 'czech-republic';

  void setCityAndState(String city, String state) {
    selectedCity = city;
    selectedState = state;
    notifyListeners();
  }

  Future<AirQualityModel> getAirQuality() {
    return ProxyService.getAirQuality(selectedCountry, selectedState, selectedCity);
  }
}