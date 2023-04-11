import '../entities/entities.dart';

abstract class IGeolocation {
  Future<WeatherEntity> getWeatherData({
    required double latitude,
    required double longitude,
  });
}
