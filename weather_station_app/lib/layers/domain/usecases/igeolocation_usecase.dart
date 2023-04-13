import '../entities/entities.dart';

abstract class IGeolocationUsecase {
  Future<DirectGeocodingEntity> getGeolocationData({required String cityName});
}
