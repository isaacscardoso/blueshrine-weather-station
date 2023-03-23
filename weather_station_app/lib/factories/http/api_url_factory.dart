import 'package:flutter_dotenv/flutter_dotenv.dart';

String makeApiUrl({
  required String scheme,
  required String subdomain,
  String? path,
}) {
  return '$scheme://$subdomain.openweathermap.org/$path';
}

String meteorologyUrlWithParameters({
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

String geolocationUrlWithParameters({
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
