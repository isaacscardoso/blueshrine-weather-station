import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import 'package:weather_station_app/domain/helpers/helpers.dart';
import 'package:weather_station_app/domain/usecases/usecases.dart';
import 'package:weather_station_app/data/usecases/usecases.dart';
import 'package:weather_station_app/data/http/http.dart';

import '../../infrastructure/mocks/mocks.dart';
import '../../domain/mocks/mocks.dart';
import '../mocks/mocks.dart';

void main() async {
  late HttpClientSpy httpClient;
  late String url;
  late RemoteMeteorology systemUnderTest;
  late MeteorologyParameters parameters;
  late Map apiResult;
  late ApiUrlFactory apiUrlFactory;

  await dotenv.load(fileName: '.env');

  setUp(() {
    httpClient = HttpClientSpy();
    apiUrlFactory = ApiUrlFactory();
    url = apiUrlFactory.mockedUrl();
    systemUnderTest = RemoteMeteorology(httpClient: httpClient);
    parameters = ParametersFactory.connect();
    apiResult = ApiFactory.correctBody();
    httpClient.mockRequest(apiResult);
  });

  test('Should make the HTTP connection with the correct values.', () async {
    await systemUnderTest.getGeolocationData(parameters: parameters);

    verify(
      () => httpClient.request(
        url: url,
        method: 'post',
        body: {'cityName': parameters.cityName},
      ),
    );
  });

  test('Should throw an Unexpected exception when the http request returns an BadRequest.', () async {
    httpClient.mockRequestError(HttpError.badRequest);

    final future = systemUnderTest.getGeolocationData(parameters: parameters);

    expect(future, throwsA(DomainError.unexpected));
  });

  test('Should throw an InvalidInputError exception when the http request returns an NotFound.', () async {
    httpClient.mockRequestError(HttpError.notFound);

    final future = systemUnderTest.getGeolocationData(parameters: parameters);

    expect(future, throwsA(DomainError.invalidInputError));
  });

  test('Should throw an Unexpected exception when the http request returns an InternalServerError.', () async {
    httpClient.mockRequestError(HttpError.internalServerError);

    final future = systemUnderTest.getGeolocationData(parameters: parameters);

    expect(future, throwsA(DomainError.unexpected));
  });
}
