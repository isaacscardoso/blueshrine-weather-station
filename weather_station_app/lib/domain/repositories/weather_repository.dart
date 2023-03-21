import '../entities/entities.dart';

abstract class WeatherRepository {
  Future<WeatherEntity> fetchWeather(String city);
}
