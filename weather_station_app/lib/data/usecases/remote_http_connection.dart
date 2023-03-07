import '../../domain/usecases/usecases.dart';
import '../../domain/entities/entities.dart';

import '../http/http.dart';
import '../models/models.dart';

class RemoteHttpConnection implements HttpConnection {
  final HttpClient httpClient;
  final String url;

  RemoteHttpConnection({
    required this.httpClient,
    required this.url,
  });

  @override
  Future<DirectGeocodingEntity> connect({required String city}) async {
    try {
      final httpResponse = await httpClient.request(url: url, method: 'get');
      return RemoteDirectGeocodingModel.fromJson(httpResponse)
          .toDirectGeocodingEntity();
    } on HttpError {
      rethrow;
    }
  }
}
