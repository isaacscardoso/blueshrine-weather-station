import 'package:equatable/equatable.dart';

class DirectGeocodingEntity extends Equatable {
  final String name;
  final String country;
  final String state;
  final double latitude;
  final double longitude;

  const DirectGeocodingEntity({
    required this.name,
    required this.country,
    required this.state,
    required this.latitude,
    required this.longitude,
  });

  @override
  List<Object?> get props => [name, country, state, latitude, longitude];
}
