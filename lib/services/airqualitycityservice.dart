import 'package:aqapp/services/airqualitystateservice.dart';
import 'package:aqapp/services/proxyservice.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AirQualityCityService extends ChangeNotifier {

  String _selectedCity = '--';
  bool _showDropdown = false;
  List<String> cities = [];

  bool get showDropdown => _showDropdown;

  set showDropdown(bool value) {
    _showDropdown = value;
    cities = [];
    notifyListeners();
  }

  String get selectedCity => _selectedCity;

  set selectedCity(String value) {
    _selectedCity = value;
    notifyListeners();
  }

  triggerFetchingData() {
    notifyListeners();
  }

  Future<List<String>> getCitiesByStateAndCountry(BuildContext context) async {
    if (cities.isEmpty) {
      var aqsService = Provider.of<AirQualityStateService>(context, listen: false);
      var selectedState = aqsService.selectedState;
      cities = await ProxyService.getCitiesByStateAndCountry(aqsService.selectedCountry, selectedState);
    }

    return cities;
  }
}