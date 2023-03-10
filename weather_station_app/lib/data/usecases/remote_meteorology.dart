import '../../domain/usecases/usecases.dart';
import '../../domain/entities/entities.dart';

import '../http/http.dart';
import '../models/models.dart';
import './usecases.dart';

class RemoteMeteorology implements Meteorology {
  final HttpClient httpClient;
  final String url;

  RemoteMeteorology({
    required this.httpClient,
    required this.url,
  });

  @override
  Future<DirectGeocodingEntity> getGeolocationData({
    required MeteorologyParameters parameters,
  }) async {
    final body = RemoteMeteorologyParameters.fromDomain(parameters).toJson();
    try {
      final httpResponse = await httpClient.request(
        url: url,
        method: 'post',
        body: body,
      );
      return RemoteDirectGeocodingModel.fromJson(httpResponse)
          .toDirectGeocodingEntity();
    } on HttpError {
      rethrow;
    }
  }
}
