import 'package:equatable/equatable.dart';

class DirectGeocodingEntity extends Equatable {
  final String name;
  final double latitude;
  final double longitude;
  final String country;

  const DirectGeocodingEntity({
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.country,
  });

  @override
  List<Object?> get props => [name, latitude, longitude, country];
}
