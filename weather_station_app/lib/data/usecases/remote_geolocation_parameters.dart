import '../../domain/usecases/usecases.dart';

class RemoteGeolocationParameters {
  final double latitude;
  final double longitude;

  RemoteGeolocationParameters({
    required this.latitude,
    required this.longitude,
  });

  factory RemoteGeolocationParameters.fromDomain(
      GeolocationParameters parameters) {
    return RemoteGeolocationParameters(
      latitude: parameters.latitude,
      longitude: parameters.longitude,
    );
  }

  Map<String, double> toJson() =>
      {'latitude': latitude, 'longitude': longitude};
}
