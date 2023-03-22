import 'package:test/test.dart';
import 'package:faker/faker.dart';

import 'package:weather_station_app/data/http/http.dart';
import 'package:weather_station_app/data/usecases/usecases.dart';
import 'package:weather_station_app/data/repositories/repositories.dart';

import 'package:weather_station_app/domain/helpers/helpers.dart';

import '../../infrastructure/mocks/mocks.dart';
import '../mocks/mocks.dart';

void main() {
  late HttpClientSpy httpClient;
  late String url;
  late String cityName;
  late Map apiResult;
  late RemoteMeteorology remoteMeteorology;
  late RemoteGeolocation remoteGeolocation;
  late RemoteWeatherRepository systemUnderTest;

  setUp(() {
    httpClient = HttpClientSpy();
    url = faker.internet.httpUrl();
    cityName = faker.address.city();
    apiResult = ApiFactory.correctBody();
    remoteMeteorology = RemoteMeteorology(httpClient: httpClient, url: url);
    remoteGeolocation = RemoteGeolocation(httpClient: httpClient, url: url);
    systemUnderTest = RemoteWeatherRepository(
      remoteMeteorology: remoteMeteorology,
      remoteGeolocation: remoteGeolocation,
    );
    httpClient.mockRequest(apiResult);
  });

  test('Should throw an InvalidInputError exception when the http request returns an NotFound.', () async {
    httpClient.mockRequestError(HttpError.notFound);

    final future = systemUnderTest.fetchWeather(cityName);

    expect(future, throwsA(DomainError.invalidInputError));
  });
}
