import '../entities/entities.dart';
import './usecases.dart';

abstract class HttpConnection {
  Future<DirectGeocodingEntity> connect({
    required HttpConnectionParameters parameters,
  });
}
