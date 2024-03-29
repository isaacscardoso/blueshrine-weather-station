import 'package:equatable/equatable.dart';

import '../http/http.dart';
import '../../domain/entities/entities.dart';

class DirectGeocodingModel extends Equatable {
  final String name;
  final String country;
  final String state;
  final double latitude;
  final double longitude;

  const DirectGeocodingModel({
    required this.name,
    required this.country,
    required this.state,
    required this.latitude,
    required this.longitude,
  });

  factory DirectGeocodingModel.fromJson(List<dynamic> geoData) {
    if (geoData.isNotEmpty) {
      Map<String, dynamic> json = geoData[0];
      return DirectGeocodingModel(
        name: json['name'],
        country: json['country'],
        state: json['state'] ?? '',
        latitude: json['lat'],
        longitude: json['lon'],
      );
    }
    throw HttpError.notFound;
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
