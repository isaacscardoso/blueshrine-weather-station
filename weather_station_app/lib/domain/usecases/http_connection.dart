import '../entities/entities.dart';

abstract class HttpConnection {
  Future<DirectGeocodingEntity> connect({required String city});
}
