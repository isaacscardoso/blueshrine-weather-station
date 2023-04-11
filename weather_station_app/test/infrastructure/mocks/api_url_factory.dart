import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather_station_app/layers/factories/http/make_api_url.dart';

class ApiUrlFactory {
  static String get apiUrl {
    return MakeApiUrl.of(
      scheme: 'https',
      subdomain: 'api',
      path: 'geo/1.0/direct',
    );
  }

  static String meteorology({
    required String cityName,
    required String limit,
  }) {
    Map<String, dynamic> parameters = {
      'q': cityName,
      'limit': limit,
      'appid': dotenv.env['APPID'],
    };
    Uri uri = Uri.parse(apiUrl);
    return uri.replace(queryParameters: parameters).toString();
  }

  static String geolocation({
    required double latitude,
    required double longitude,
  }) {
    Map<String, dynamic> parameters = {
      'lat': latitude.toString(),
      'lon': longitude.toString(),
      'appid': dotenv.env['APPID'],
    };
    Uri uri = Uri.parse(apiUrl);
    return uri.replace(queryParameters: parameters).toString();
  }
}
