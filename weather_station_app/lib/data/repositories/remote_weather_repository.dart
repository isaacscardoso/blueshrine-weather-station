import '../../domain/repositories/repositories.dart';
import '../../domain/entities/entities.dart';
import '../../domain/usecases/usecases.dart';

import '../usecases/usecases.dart';

class RemoteWeatherRepository implements WeatherRepository {
  final RemoteMeteorology remoteMeteorology;
  final RemoteGeolocation remoteGeolocation;

  RemoteWeatherRepository({
    required this.remoteMeteorology,
    required this.remoteGeolocation,
  });

  @override
  Future<WeatherEntity> fetchWeather(String cityName) async {
    final MeteorologyParameters meteorologyParameters =
        MeteorologyParameters(cityName: cityName);

    try {
      final DirectGeocodingEntity meteorology = await remoteMeteorology
          .getGeolocationData(parameters: meteorologyParameters);

      final GeolocationParameters geolocationParameters = GeolocationParameters(
        latitude: meteorology.latitude,
        longitude: meteorology.longitude,
      );

      final WeatherEntity weatherEntity = await remoteGeolocation
          .getWeatherData(parameters: geolocationParameters);

      return weatherEntity;
    } catch (error) {
      rethrow;
    }
  }
}
