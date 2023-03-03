import 'package:equatable/equatable.dart';

import '../../domain/entities/entities.dart';

class RemoteWeatherModel extends Equatable {
  final String name;
  final String country;
  final String description;
  final String icon;
  final double temperature;
  final double minimunTemperature;
  final double maximumTemperature;
  final DateTime lastUpdated;

  const RemoteWeatherModel({
    required this.name,
    required this.country,
    required this.description,
    required this.icon,
    required this.temperature,
    required this.minimunTemperature,
    required this.maximumTemperature,
    required this.lastUpdated,
  });

  factory RemoteWeatherModel.fromJson(Map json) {
    return RemoteWeatherModel(
      name: json['name'],
      country: json['country'],
      description: json['description'],
      icon: json['icon'],
      temperature: json['temperature'],
      minimunTemperature: json['minimunTemperature'],
      maximumTemperature: json['maximumTemperature'],
      lastUpdated: json['lastUpdated'],
    );
  }

  WeatherEntity toWeatherEntity({
    String? name,
    String? country,
    String? description,
    String? icon,
    double? temperature,
    double? minimunTemperature,
    double? maximumTemperature,
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
      lastUpdated,
    ];
  }
}
