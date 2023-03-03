import 'package:equatable/equatable.dart';

import '../../domain/entities/entities.dart';

class RemoteDirectGeocodingModel extends Equatable {
  final String name;
  final String country;
  final String state;
  final double latitude;
  final double longitude;

  const RemoteDirectGeocodingModel({
    required this.name,
    required this.country,
    required this.state,
    required this.latitude,
    required this.longitude,
  });

  factory RemoteDirectGeocodingModel.fromJson(Map json) {
    return RemoteDirectGeocodingModel(
      name: json['name'],
      country: json['country'],
      state: json['state'],
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }

  DirectGeocodingEntity toDirectGeocodingEntity() {
    return DirectGeocodingEntity(
      name: name,
      country: country,
      state: state,
      latitude: latitude,
      longitude: longitude,
    );
  }

  @override
  List<Object?> get props => [name, country, state, latitude, longitude];
}
