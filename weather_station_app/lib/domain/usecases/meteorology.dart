import '../entities/entities.dart';
import './usecases.dart';

abstract class Meteorology {
  Future<DirectGeocodingEntity> getGeolocationData({
    required MeteorologyParameters parameters,
  });
}
