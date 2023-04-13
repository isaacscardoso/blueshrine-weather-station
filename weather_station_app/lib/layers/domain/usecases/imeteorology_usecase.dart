import '../entities/entities.dart';

abstract class IMeteorologyUsecase {
  Future<DirectGeocodingEntity> getGeolocationData({required String cityName});
}
