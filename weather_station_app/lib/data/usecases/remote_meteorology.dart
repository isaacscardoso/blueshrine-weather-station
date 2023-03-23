import '../../factories/http/http.dart';
import '../../domain/usecases/usecases.dart';
import '../../domain/entities/entities.dart';
import '../../domain/helpers/helpers.dart';

import '../http/http.dart';
import '../models/models.dart';
import './usecases.dart';

class RemoteMeteorology implements Meteorology {
  final HttpClient httpClient;

  RemoteMeteorology({required this.httpClient});

  @override
  Future<DirectGeocodingEntity> getGeolocationData({
    required MeteorologyParameters parameters,
  }) async {
    final body = RemoteMeteorologyParameters.fromDomain(parameters).toJson();

    final String apiUrl = makeApiUrl(
      scheme: 'https',
      subdomain: 'api',
      path: 'geo/1.0/direct',
    );

    // TODO: Refactor code line below.
    final String url = meteorologyUrlWithParameters(
      url: apiUrl,
      cityName: body['cityName']!,
      limit: '1',
    );

    try {
      final httpResponse = await httpClient.request(
        url: url,
        method: 'get',
        body: body,
      );

      return RemoteDirectGeocodingModel.fromJson(httpResponse)
          .toDirectGeocodingEntity();
    } on HttpError catch (error) {
      throw error == HttpError.notFound
          ? DomainError.invalidInputError
          : DomainError.unexpected;
    }
  }
}
