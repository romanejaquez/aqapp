import 'package:aqapp/services/proxyservice.dart';
import 'package:flutter/material.dart';

class AirQualityStateService extends ChangeNotifier {

  String _selectedCountry = 'USA';
  String _selectedState = '--';

  String get selectedState => _selectedState;

  set selectedState(String value) {
    _selectedState = value;
    //notifyListeners();
  }

  Future<List<String>> getStatesByCountry() {
    return ProxyService.getStatesByCountry(_selectedCountry);
  }
}