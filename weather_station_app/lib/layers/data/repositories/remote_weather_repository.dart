import '../../domain/usecases/usecases.dart';
import '../../domain/entities/entities.dart';
import '../../domain/repositories/repositories.dart';

class RemoteWeatherRepository implements IWeatherRepository {
  final IMeteorology meteorology;
  final IGeolocation geolocation;

  RemoteWeatherRepository({
    required this.meteorology,
    required this.geolocation,
  });

  @override
  Future<WeatherEntity> fetchWeather(String cityName) async {
    try {
      final DirectGeocodingEntity geocoding =
          await meteorology.getGeolocationData(
        cityName: cityName,
      );

      final WeatherEntity weatherEntity = await geolocation.getWeatherData(
        latitude: geocoding.latitude,
        longitude: geocoding.longitude,
      );

      return weatherEntity;
    } catch (error) {
      rethrow;
    }
  }
}
