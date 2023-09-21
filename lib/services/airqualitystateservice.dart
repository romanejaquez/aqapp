import 'package:aqapp/services/proxyservice.dart';
import 'package:flutter/material.dart';

class AirQualityStateService extends ChangeNotifier {

  String selectedCountry = 'czech-republic';
  String _selectedState = '--';
  List<String> states = [];

  String get selectedState => _selectedState;

  set selectedState(String value) {
    _selectedState = value;
    notifyListeners();
  }

  Future<List<String>> getStatesByCountry() async {
    if (states.isEmpty) {
      states = await ProxyService.getStatesByCountry(selectedCountry);
    }
    return states;
  }
}