import '../../domain/usecases/usecases.dart';
import '../../domain/entities/entities.dart';
import '../../domain/repositories/repositories.dart';

class RemoteWeatherRepositoryImpl implements IWeatherRepository {
  final IGeolocationUsecase geolocationUsecase;
  final IMeteorologyUsecase meteorologyUsecase;

  RemoteWeatherRepositoryImpl({
    required this.geolocationUsecase,
    required this.meteorologyUsecase,
  });

  @override
  Future<WeatherEntity> fetchWeather(String cityName) async {
    try {
      final DirectGeocodingEntity geocoding =
          await geolocationUsecase.getGeolocationData(
        cityName: cityName,
      );

      final WeatherEntity weatherEntity =
          await meteorologyUsecase.getMeteorologyData(
        latitude: geocoding.latitude,
        longitude: geocoding.longitude,
      );

      return weatherEntity;
    } catch (error) {
      rethrow;
    }
  }
}
