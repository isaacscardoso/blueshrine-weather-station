import 'package:equatable/equatable.dart';

import '../http/http.dart';
import '../../domain/entities/entities.dart';

class WeatherModel extends Equatable {
  final String name;
  final String country;
  final String description;
  final String icon;
  final double temperature;
  final double minimunTemperature;
  final double maximumTemperature;
  //final DateTime currentTime;
  final int currentTime;
  final DateTime lastUpdated;

  const WeatherModel({
    required this.name,
    required this.country,
    required this.description,
    required this.icon,
    required this.temperature,
    required this.minimunTemperature,
    required this.maximumTemperature,
    required this.currentTime,
    required this.lastUpdated,
  });

  factory WeatherModel.fromJson(Map json) {
    if (json['cod'] != '400') {
      final Map jsonWeather = json['weather'][0];
      final Map jsonMain = json['main'];

      return WeatherModel(
        name: json['name'],
        country: json['sys']['country'],
        description: jsonWeather['description'],
        icon: jsonWeather['icon'],
        temperature: jsonMain['temp'],
        minimunTemperature: jsonMain['temp_min'],
        maximumTemperature: jsonMain['temp_max'],
        currentTime: json['timezone'],
        lastUpdated: DateTime.now(),
      );
    }
    throw HttpError.notFound;
  }

  WeatherEntity toWeatherEntity({
    String? name,
    String? country,
    String? description,
    String? icon,
    double? temperature,
    double? minimunTemperature,
    double? maximumTemperature,
    //DateTime? currentTime,
    int? currentTime,
    DateTime? lastUpdated,
  }) {
    return WeatherEntity(
      name: name ?? this.name,
      country: country ?? this.country,
      description: description ?? this.description,
      icon: icon ?? this.icon,
      temperature: temperature ?? this.temperature,
      minimunTemperature: minimunTemperature ?? this.minimunTemperature,
      maximumTemperature: maximumTemperature ?? this.maximumTemperature,
      currentTime: currentTime ?? this.currentTime,
      lastUpdated: lastUpdated ?? this.lastUpdated,
    );
  }

  @override
  List<Object?> get props {
    return [
      name,
      country,
      description,
      icon,
      temperature,
      minimunTemperature,
      maximumTemperature,
      currentTime,
      lastUpdated,
    ];
  }
}
