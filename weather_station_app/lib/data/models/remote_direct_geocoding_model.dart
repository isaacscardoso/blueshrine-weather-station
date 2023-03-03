import 'package:equatable/equatable.dart';

import '../../domain/entities/entities.dart';

class RemoteDirectGeocodingModel extends Equatable {
  final String name;
  final double latitude;
  final double longitude;
  final String country;

  const RemoteDirectGeocodingModel({
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.country,
  });

  factory RemoteDirectGeocodingModel.fromJson(Map json) {
    return RemoteDirectGeocodingModel(
      name: json['name'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      country: json['country'],
    );
  }

  DirectGeocodingEntity toDirectGeocodingEntity() {
    return DirectGeocodingEntity(
      name: name,
      latitude: latitude,
      longitude: longitude,
      country: country,
    );
  }

  @override
  List<Object?> get props => [name, latitude, longitude, country];
}
