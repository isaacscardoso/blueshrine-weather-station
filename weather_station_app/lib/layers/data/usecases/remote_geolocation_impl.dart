import '../../domain/entities/entities.dart';
import '../../domain/usecases/usecases.dart';
import '../../domain/helpers/helpers.dart';

import '../../factories/api/constants.dart';
import '../../factories/http/http.dart';

import '../models/models.dart';
import '../http/http.dart';

class RemoteGeolocationImpl implements IGeolocationUsecase {
  final IHttpClient httpClient;

  RemoteGeolocationImpl({required this.httpClient});

  @override
  Future<DirectGeocodingEntity> getGeolocationData({
    required String cityName,
  }) async {
    final String apiUrl = MakeApiUrl.of(
      scheme: 'https',
      subdomain: 'api',
      path: 'geo/1.0/direct',
    );

    final String url = MakeUrlWithParameters.geolocation(
      url: apiUrl,
      cityName: cityName,
      limit: AppParams.limit,
    );

    try {
      final List<dynamic> httpResponse = await httpClient.request(
        url: url,
        method: 'get',
      );

      return RemoteDirectGeocodingModel.fromJson(
        httpResponse,
      ).toDirectGeocodingEntity();
    } on HttpError catch (error) {
      throw error == HttpError.notFound
          ? DomainError.invalidInputError
          : DomainError.unexpected;
    }
  }
}