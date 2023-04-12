import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather_station_app/layers/factories/http/make_api_url.dart';

class ApiUrlFactory {
  static String meteorology({
    required String cityName,
    required String limit,
  }) {
    final String meteorologyApiUrl = MakeApiUrl.of(
      scheme: 'https',
      subdomain: 'api',
      path: 'geo/1.0/direct',
    );

    Map<String, dynamic> parameters = {
      'q': cityName,
      'limit': limit,
      'appid': dotenv.env['APPID'],
    };

    Uri uri = Uri.parse(meteorologyApiUrl);

    return uri.replace(queryParameters: parameters).toString();
  }

  static String geolocation({
    required double latitude,
    required double longitude,
  }) {
    final String geolocationApiUrl = MakeApiUrl.of(
      scheme: 'https',
      subdomain: 'api',
      path: 'data/2.5/weather',
    );

    Map<String, dynamic> parameters = {
      'lat': latitude.toString(),
      'lon': longitude.toString(),
      'appid': dotenv.env['APPID'],
    };

    Uri uri = Uri.parse(geolocationApiUrl);

    return uri.replace(queryParameters: parameters).toString();
  }
}
