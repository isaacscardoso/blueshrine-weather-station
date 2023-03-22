import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:weather_station_app/factories/http/http.dart';

class ApiUrlFactory {
  String _mockMakeApiUrl() {
    return makeApiUrl(
      scheme: 'https',
      subdomain: 'api',
      path: 'geo/1.0/direct',
    );
  }

  Map<String, dynamic> _mockMakeQueryParameters(
    String? cityName,
    String? limit,
  ) {
    return {
      'q': cityName ?? 'name',
      'limit': limit ?? 'limit',
      'appid': dotenv.env['APPID'],
    };
  }

  String mockedUrl({String? cityName, String? limit}) {
    String url = _mockMakeApiUrl();
    Uri uri = Uri.parse(url);
    return uri
        .replace(queryParameters: _mockMakeQueryParameters(cityName, limit))
        .toString();
  }
}
