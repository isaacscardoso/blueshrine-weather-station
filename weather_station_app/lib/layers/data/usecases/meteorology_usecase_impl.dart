import '../../domain/entities/entities.dart';
import '../../domain/helpers/helpers.dart';
import '../../domain/usecases/usecases.dart';

import '../../factories/http/http.dart';

import '../models/models.dart';
import '../http/http.dart';

class MeteorologyUsecaseImpl implements IMeteorologyUsecase {
  final IHttpClient httpClient;

  MeteorologyUsecaseImpl({required this.httpClient});

  @override
  Future<WeatherEntity> getMeteorologyData({
    required double latitude,
    required double longitude,
  }) async {
    final String apiUrl = MakeApiUrl.of(
      scheme: 'https',
      subdomain: 'api',
      path: 'data/2.5/weather',
    );

    final String url = MakeUrlWithParameters.meteorology(
      url: apiUrl,
      latitude: latitude,
      longitude: longitude,
    );

    try {
      final httpResponse = await httpClient.request(url: url, method: 'get');
      return WeatherModel.fromJson(httpResponse).toWeatherEntity();
    } on HttpError catch (error) {
      throw error == HttpError.notFound
          ? DomainError.invalidInputError
          : DomainError.unexpected;
    }
  }
}
