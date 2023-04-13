import '../entities/entities.dart';

abstract class IMeteorologyUsecase {
  Future<WeatherEntity> getWeatherData({
    required double latitude,
    required double longitude,
  });
}
