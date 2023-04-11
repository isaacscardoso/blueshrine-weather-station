import '../entities/entities.dart';

abstract class IWeatherRepository {
  Future<WeatherEntity> fetchWeather(String cityName);
}
