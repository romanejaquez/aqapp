import 'package:http/http.dart';

class AirQualityModel {

  final String city;
  final String state;
  final String country;
  final double airQuality;
  final double temp;
  final double humidity;
  final double windSpeed;
  final String icon;

  AirQualityModel({
    required this.city,
    required this.state,
    required this.airQuality,
    required this.temp,
    required this.humidity,
    required this.windSpeed,
    required this.country,
    required this.icon
  });

  factory AirQualityModel.fromJson(Map<String, dynamic> json) {
    return AirQualityModel(
      city: json['data']['city'], 
      state: json['data']['state'],
      country: json['data']['country'],
      airQuality: json['data']['current']['pollution']['aqius'], 
      temp: json['data']['current']['weather']['tp'],
      humidity: json['data']['current']['weather']['hu'], 
      windSpeed: json['data']['current']['weather']['ws'],
      icon: json['data']['current']['weather']['ic'],
    );
  }
}