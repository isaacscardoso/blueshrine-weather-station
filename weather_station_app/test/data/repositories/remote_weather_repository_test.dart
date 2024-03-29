import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:http/http.dart';
import 'package:test/test.dart';

import 'package:weather_station_app/layers/data/repositories/repositories.dart';
import 'package:weather_station_app/layers/data/usecases/usecases.dart';
import 'package:weather_station_app/layers/data/http/http.dart';
import 'package:weather_station_app/layers/factories/http/http.dart';

void main() async {
  late IHttpClient httpClient;
  late GeolocationUsecaseImpl meteorology;
  late MeteorologyUsecaseImpl geolocation;
  late WeatherRepositoryImpl systemUnderTest;
  late String cityName;

  await dotenv.load(fileName: '.env');

  setUp(() {
    httpClient = MakeHttpAdapter.of(Client());

    meteorology = GeolocationUsecaseImpl(httpClient: httpClient);
    geolocation = MeteorologyUsecaseImpl(httpClient: httpClient);

    systemUnderTest = WeatherRepositoryImpl(
      geolocationUsecase: meteorology,
      meteorologyUsecase: geolocation,
    );

    cityName = 'London';
  });

  test('Should return the correct geolocation values.', () async {
    final geoData = await meteorology.getGeolocationData(cityName: cityName);

    final weaData = await geolocation.getMeteorologyData(
      latitude: geoData.latitude,
      longitude: geoData.longitude,
    );

    final weather = await systemUnderTest.fetchWeather(cityName);

    expect(weather.name, weaData.name);
  });
}
