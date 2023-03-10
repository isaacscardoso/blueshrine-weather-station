import '../../domain/usecases/usecases.dart';
import '../../domain/entities/entities.dart';

import '../http/http.dart';
import '../models/models.dart';
import './usecases.dart';

class RemoteGeolocation implements Geolocation {
  final HttpClient httpClient;
  final String url;

  RemoteGeolocation({required this.httpClient, required this.url});

  @override
  Future<WeatherEntity> getWeatherData({
    required GeolocationParameters parameters,
  }) async {
    final body = RemoteGeolocationParameters.fromDomain(parameters).toJson();
    try {
      final httpResponse = await httpClient.request(
        url: url,
        method: 'post',
        body: body,
      );
      return RemoteWeatherModel.fromJson(httpResponse).toWeatherEntity();
    } on HttpError {
      rethrow;
    }
  }
}
