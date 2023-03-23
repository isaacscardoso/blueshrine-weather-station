import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:test/test.dart';

import 'package:weather_station_app/data/http/http.dart';
import 'package:weather_station_app/data/usecases/usecases.dart';
import 'package:weather_station_app/data/repositories/repositories.dart';
import 'package:weather_station_app/domain/usecases/geolocation_parameters.dart';
import 'package:weather_station_app/domain/usecases/meteorology_parameters.dart';

import 'package:weather_station_app/factories/http/http.dart';

void main() async {
  late HttpClient httpClient;
  late RemoteMeteorology meteorology;
  late RemoteGeolocation geolocation;
  late RemoteWeatherRepository systemUnderTest;
  late String cityName;

  await dotenv.load(fileName: '.env');

  setUp(() {
    httpClient = makeHttpAdapter();

    meteorology = RemoteMeteorology(httpClient: httpClient);
    geolocation = RemoteGeolocation(httpClient: httpClient);

    systemUnderTest = RemoteWeatherRepository(
      remoteMeteorology: meteorology,
      remoteGeolocation: geolocation,
    );

    cityName = 'London';
  });

  test('Should return the correct geolocation values.', () async {
    final geoData = await meteorology.getGeolocationData(
      parameters: MeteorologyParameters(cityName: cityName),
    );

    final weaData = await geolocation.getWeatherData(
      parameters: GeolocationParameters(
        latitude: geoData.latitude,
        longitude: geoData.longitude,
      ),
    );

    final weather = await systemUnderTest.fetchWeather(cityName);

    expect(weather.name, weaData.name);
  });
}
