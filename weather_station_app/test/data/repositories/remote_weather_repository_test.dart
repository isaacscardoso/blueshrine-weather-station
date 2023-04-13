import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:http/http.dart';
import 'package:test/test.dart';

import 'package:weather_station_app/layers/data/repositories/repositories.dart';
import 'package:weather_station_app/layers/data/usecases/usecases.dart';
import 'package:weather_station_app/layers/data/http/http.dart';
import 'package:weather_station_app/layers/factories/http/http.dart';

void main() async {
  late IHttpClient httpClient;
  late RemoteGeolocationImpl meteorology;
  late RemoteMeteorologyImpl geolocation;
  late RemoteWeatherRepositoryImpl systemUnderTest;
  late String cityName;

  await dotenv.load(fileName: '.env');

  setUp(() {
    httpClient = MakeHttpAdapter.of(Client());

    meteorology = RemoteGeolocationImpl(httpClient: httpClient);
    geolocation = RemoteMeteorologyImpl(httpClient: httpClient);

    systemUnderTest = RemoteWeatherRepositoryImpl(
      meteorology: meteorology,
      geolocation: geolocation,
    );

    cityName = 'London';
  });

  test('Should return the correct geolocation values.', () async {
    final geoData = await meteorology.getGeolocationData(cityName: cityName);

    final weaData = await geolocation.getWeatherData(
      latitude: geoData.latitude,
      longitude: geoData.longitude,
    );

    final weather = await systemUnderTest.fetchWeather(cityName);

    expect(weather.name, weaData.name);
  });
}
