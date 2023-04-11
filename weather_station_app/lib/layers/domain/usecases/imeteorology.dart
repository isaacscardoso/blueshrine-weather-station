import '../entities/entities.dart';

abstract class IMeteorology {
  Future<DirectGeocodingEntity> getGeolocationData({required String cityName});
}
