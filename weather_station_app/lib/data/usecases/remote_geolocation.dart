import '../../factories/http/http.dart';
import '../../domain/usecases/usecases.dart';
import '../../domain/entities/entities.dart';
import '../../domain/helpers/helpers.dart';

import '../http/http.dart';
import '../models/models.dart';
import './usecases.dart';

class RemoteGeolocation implements Geolocation {
  final HttpClient httpClient;

  RemoteGeolocation({required this.httpClient});

  @override
  Future<WeatherEntity> getWeatherData({
    required GeolocationParameters parameters,
  }) async {
    final body = RemoteGeolocationParameters.fromDomain(parameters).toJson();

    final String apiUrl = makeApiUrl(
      scheme: 'https',
      subdomain: 'api',
      path: 'data/2.5/weather',
    );

    // TODO: Refactor code line below.
    final String url = geolocationUrlWithParameters(
      url: apiUrl,
      latitude: body['latitude']!,
      longitude: body['longitude']!,
    );

    try {
      final httpResponse = await httpClient.request(
        url: url,
        method: 'get',
        body: body,
      );
      return RemoteWeatherModel.fromJson(httpResponse).toWeatherEntity();
    } on HttpError catch (error) {
      throw error == HttpError.notFound
          ? DomainError.invalidInputError
          : DomainError.unexpected;
    }
  }
}
