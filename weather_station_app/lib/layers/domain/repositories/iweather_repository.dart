import '../entities/entities.dart';

abstract class IWeatherRepository {
  Future<WeatherEntity> initWeather({
    required double latitude,
    required double longitude,
  });

  Future<WeatherEntity> fetchWeather(String cityName);
}
