import '../entities/entities.dart';

abstract class IMeteorologyUsecase {
  Future<WeatherEntity> getMeteorologyData({
    required double latitude,
    required double longitude,
  });
}
