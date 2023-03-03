import 'package:equatable/equatable.dart';

import '../../domain/entities/entities.dart';

class RemoteDirectGeocodingModel extends Equatable {
  final String name;
  final String country;
  final double latitude;
  final double longitude;

  const RemoteDirectGeocodingModel({
    required this.name,
    required this.country,
    required this.latitude,
    required this.longitude,
  });

  factory RemoteDirectGeocodingModel.fromJson(Map json) {
    return RemoteDirectGeocodingModel(
      name: json['name'],
      country: json['country'],
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }

  DirectGeocodingEntity toDirectGeocodingEntity() {
    return DirectGeocodingEntity(
      name: name,
      country: country,
      latitude: latitude,
      longitude: longitude,
    );
  }

  @override
  List<Object?> get props => [name, country, latitude, longitude];
}
