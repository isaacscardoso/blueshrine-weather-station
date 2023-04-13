import 'package:flutter_dotenv/flutter_dotenv.dart';

class MakeUrlWithParameters {
  static String geolocation({
    required String url,
    required String cityName,
    required String limit,
  }) {
    Map<String, dynamic> parameters = {
      'q': cityName,
      'limit': limit,
      'appid': dotenv.env['APPID'],
    };
    Uri uri = Uri.parse(url);
    return uri.replace(queryParameters: parameters).toString();
  }

  static String meteorology({
    required String url,
    required double latitude,
    required double longitude,
  }) {
    Map<String, dynamic> parameters = {
      'lat': latitude.toString(),
      'lon': longitude.toString(),
      'appid': dotenv.env['APPID'],
    };
    Uri uri = Uri.parse(url);
    return uri.replace(queryParameters: parameters).toString();
  }
}
