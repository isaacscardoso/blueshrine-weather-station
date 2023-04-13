import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:mocktail/mocktail.dart';
import 'package:faker/faker.dart';
import 'package:test/test.dart';

import 'package:weather_station_app/layers/domain/helpers/helpers.dart';
import 'package:weather_station_app/layers/data/usecases/usecases.dart';
import 'package:weather_station_app/layers/data/http/http.dart';

import '../../infrastructure/mocks/mocks.dart';
import '../mocks/mocks.dart';

void main() async {
  late HttpClientSpy httpClient;
  late RemoteMeteorologyImpl systemUnderTest;
  late List<Map<String, dynamic>> apiResult;
  late String url;
  late String cityName;

  await dotenv.load(fileName: '.env');

  setUp(() {
    httpClient = HttpClientSpy();
    systemUnderTest = RemoteMeteorologyImpl(httpClient: httpClient);
    cityName = faker.address.city();
    url = ApiUrlFactory.meteorology(cityName: cityName, limit: '1');
    apiResult = ApiFactory.correctBody();
    httpClient.mockRequest(apiResult);
  });

  test('Should make the HTTP connection with the correct values.', () async {
    await systemUnderTest.getGeolocationData(cityName: cityName);

    verify(() => httpClient.request(url: url, method: 'get'));
  });

  test('Should throw an Unexpected exception when the http request returns an BadRequest.', () async {
    httpClient.mockRequestError(HttpError.badRequest);

    final future = systemUnderTest.getGeolocationData(cityName: cityName);

    expect(future, throwsA(DomainError.unexpected));
  });

  test('Should throw an InvalidInputError exception when the http request returns an NotFound.', () async {
    httpClient.mockRequestError(HttpError.notFound);

    final future = systemUnderTest.getGeolocationData(cityName: cityName);

    expect(future, throwsA(DomainError.invalidInputError));
  });

  test('Should throw an Unexpected exception when the http request returns an InternalServerError.', () async {
    httpClient.mockRequestError(HttpError.internalServerError);

    final future = systemUnderTest.getGeolocationData(cityName: cityName);

    expect(future, throwsA(DomainError.unexpected));
  });
}
