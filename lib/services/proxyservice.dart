import 'dart:async';
import 'package:aqapp/models/airquality.model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class ProxyService {

  static const String BASE_URL = 'http://api.airvisual.com/v2/';
  static const String API_KEY = '6d34c39f-3f14-4488-84f7-48d38bae4ffe';
  static const String COUNTRIES = 'countries?key=';
  static const String STATES = 'states?country={COUNTRY}&key=';
  static const String CITIES = 'cities?state={STATE}&country={COUNTRY}&key=';
  static const String AQ_URL = 'city?city={CITY}&state={STATE}&country={COUNTRY}&key=';
  

  static Future<List<String>> getCountries() {
    List<String> countries = [];
    Completer<List<String>> countriesCompleter = Completer();

    var url = Uri.parse(BASE_URL + COUNTRIES + API_KEY);
    http.get(url).then((response) {

      var parsedJSON = convert.jsonDecode(response.body);

      if (response.statusCode == '200' && parsedJSON['status'] == 'success') {
        
        var countriesJSON = parsedJSON['data'];
        
        
        for(var country in countriesJSON) {
          countries.add(country['country']);
        }

        countriesCompleter.complete(countries);
      }
      else {
        countriesCompleter.completeError(
          const AsyncSnapshot.withError(ConnectionState.done, 'error')
        );
      }
    }).onError((error, stackTrace) {
      countriesCompleter.completeError(
        const AsyncSnapshot.withError(ConnectionState.done, 'error')
      );
    }).catchError((error) {
      countriesCompleter.completeError(
        const AsyncSnapshot.withError(ConnectionState.done, 'error')
      );
    });

    return countriesCompleter.future;    
  }

  static Future<List<String>> getStatesByCountry(String country) {
    List<String> states = [];
    Completer<List<String>> statesCompleter = Completer();

    var url = Uri.parse(BASE_URL + STATES.replaceAll(RegExp(r'{COUNTRY}'), country) + API_KEY);
    
    http.get(url).then((response) {

      var parsedJSON = convert.jsonDecode(response.body);

      if (response.statusCode == 200 && parsedJSON['status'] == 'success') {
        
        var statesJSON = parsedJSON['data'];
        
        for(var state in statesJSON) {
          states.add(state['state']);
        }

        states.insert(0, '--');
        statesCompleter.complete(states);
      }
      else {
        statesCompleter.completeError(
          const AsyncSnapshot.withError(ConnectionState.done, 'error')
        );
      }
    }).onError((error, stackTrace) {
      statesCompleter.completeError(
        const AsyncSnapshot.withError(ConnectionState.done, 'error')
      );
    }).catchError((error) {
      statesCompleter.completeError(
        const AsyncSnapshot.withError(ConnectionState.done, 'error')
      );
    });

    return statesCompleter.future;    
  }

  static Future<List<String>> getCitiesByStateAndCountry(String country, String state) {
    List<String> cities = [];
    Completer<List<String>> citiesCompleter = Completer();

    var parsedUrlPortion = CITIES.replaceAll(RegExp(r'{COUNTRY}'), country)
    .replaceAll(RegExp(r'{STATE}'), state);

    var url = Uri.parse(BASE_URL + parsedUrlPortion + API_KEY);
    
    http.get(url).then((response) {

      var parsedJSON = convert.jsonDecode(response.body);

      if (response.statusCode == 200 && parsedJSON['status'] == 'success') {
        
        var citiesJSON = parsedJSON['data'];
        
        for(var city in citiesJSON) {
          cities.add(city['city']);
        }

        cities.insert(0, '--');
        citiesCompleter.complete(cities);
      }
      else {
        citiesCompleter.completeError(
          const AsyncSnapshot.withError(ConnectionState.done, 'error')
        );
      }
    }).onError((error, stackTrace) {
      citiesCompleter.completeError(
        const AsyncSnapshot.withError(ConnectionState.done, 'error')
      );
    }).catchError((error) {
      citiesCompleter.completeError(
        const AsyncSnapshot.withError(ConnectionState.done, 'error')
      );
    });

    return citiesCompleter.future;    
  }

  static Future<AirQualityModel> getAirQuality(String country, String state, String city) {

    Completer<AirQualityModel> aqCompleter = Completer();

    var parsedUrlPortion = AQ_URL
    .replaceAll(RegExp(r'{CITY}'), city)
    .replaceAll(RegExp(r'{COUNTRY}'), country)
    .replaceAll(RegExp(r'{STATE}'), state);

    var url = Uri.parse(BASE_URL + parsedUrlPortion + API_KEY);
    
    http.get(url).then((response) {

      var parsedJSON = convert.jsonDecode(response.body);

      if (response.statusCode == 200 && parsedJSON['status'] == 'success') {
        AirQualityModel aqModel = AirQualityModel.fromJson(parsedJSON);
        aqCompleter.complete(aqModel);
      }
      else {
        aqCompleter.completeError(
          const AsyncSnapshot.withError(ConnectionState.done, 'error')
        );
      }
    }).onError((error, stackTrace) {
      aqCompleter.completeError(
        const AsyncSnapshot.withError(ConnectionState.done, 'error')
      );
    }).catchError((error) {
      aqCompleter.completeError(
        const AsyncSnapshot.withError(ConnectionState.done, 'error')
      );
    });    
    

    return aqCompleter.future;
  }
}