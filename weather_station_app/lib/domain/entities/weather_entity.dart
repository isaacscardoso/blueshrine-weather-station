import 'package:equatable/equatable.dart';

class WeatherEntity extends Equatable {
  final String name;
  final String country;
  final String description;
  final String icon;
  final double temperature;
  final double minimunTemperature;
  final double maximumTemperature;
  final DateTime lastUpdated;

  const WeatherEntity({
    required this.name,
    required this.country,
    required this.description,
    required this.icon,
    required this.temperature,
    required this.minimunTemperature,
    required this.maximumTemperature,
    required this.lastUpdated,
  });

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
      lastUpdated,
    ];
  }
}
