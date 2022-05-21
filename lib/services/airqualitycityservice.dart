import 'package:aqapp/services/airqualitystateservice.dart';
import 'package:aqapp/services/proxyservice.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AirQualityCityService extends ChangeNotifier {

  String _selectedCountry = 'USA';
  String _selectedCity = '--';
  bool _showDropdown = false;

  bool get showDropdown => _showDropdown;

  set showDropdown(bool value) {
    _showDropdown = value;
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

  Future<List<String>> getCitiesByStateAndCountry(BuildContext context) {
    var _selectedState = Provider.of<AirQualityStateService>(context, listen: false).selectedState;
    return ProxyService.getCitiesByStateAndCountry(_selectedCountry, _selectedState);
  }
}