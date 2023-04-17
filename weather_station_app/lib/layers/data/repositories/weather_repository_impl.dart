import '../../domain/usecases/usecases.dart';
import '../../domain/entities/entities.dart';
import '../../domain/repositories/repositories.dart';

class WeatherRepositoryImpl implements IWeatherRepository {
  final IGeolocationUsecase geolocationUsecase;
  final IMeteorologyUsecase meteorologyUsecase;

  WeatherRepositoryImpl({
    required this.geolocationUsecase,
    required this.meteorologyUsecase,
  });

  @override
  Future<WeatherEntity> initWeather({
    required double latitude,
    required double longitude,
  }) async {
    try {
      final WeatherEntity weather = await meteorologyUsecase.getMeteorologyData(
        latitude: latitude,
        longitude: longitude,
      );
      return weather;
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<WeatherEntity> fetchWeather(String cityName) async {
    try {
      final DirectGeocodingEntity geocoding =
          await geolocationUsecase.getGeolocationData(
        cityName: cityName,
      );

      final WeatherEntity weather = await meteorologyUsecase.getMeteorologyData(
        latitude: geocoding.latitude,
        longitude: geocoding.longitude,
      );

      return weather;
    } catch (error) {
      rethrow;
    }
  }
}
