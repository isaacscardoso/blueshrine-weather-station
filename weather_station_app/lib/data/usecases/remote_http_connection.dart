import '../../domain/usecases/usecases.dart';
import '../../domain/entities/entities.dart';

import '../models/models.dart';
import '../http/http.dart';
import './usecases.dart';

class RemoteHttpConnection implements HttpConnection {
  final HttpClient httpClient;
  final String url;

  RemoteHttpConnection({
    required this.httpClient,
    required this.url,
  });

  @override
  Future<DirectGeocodingEntity> connect({
    required HttpConnectionParameters parameters,
  }) async {
    final body = RemoteHttpConnectionParameters.fromDomain(parameters).toJson();
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
