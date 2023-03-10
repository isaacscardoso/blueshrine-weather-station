import '../entities/entities.dart';
import './usecases.dart';

abstract class Geolocation {
  Future<WeatherEntity> getWeatherData({
    required GeolocationParameters parameters,
  });
}
