import '../entities/entities.dart';

abstract class IGeolocationUsecase {
  Future<WeatherEntity> getWeatherData({
    required double latitude,
    required double longitude,
  });
}
