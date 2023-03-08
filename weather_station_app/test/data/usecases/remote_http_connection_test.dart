import 'package:faker/faker.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import 'package:weather_station_app/domain/usecases/usecases.dart';
import 'package:weather_station_app/data/usecases/usecases.dart';

import '../../infrastructure/mocks/mocks.dart';
import '../../domain/mocks/mocks.dart';
import '../mocks/mocks.dart';

void main() {
  late HttpClientSpy httpClient;
  late String url;
  late RemoteHttpConnection systemUnderTest;
  late HttpConnectionParameters parameters;
  late Map apiResult;

  setUp(() {
    httpClient = HttpClientSpy();
    url = faker.internet.httpUrl();
    systemUnderTest = RemoteHttpConnection(httpClient: httpClient, url: url);
    parameters = ParametersFactory.connect();
    apiResult = ApiFactory.correctBody();
    httpClient.mockRequest(apiResult);
  });

  test('Should make the HTTP connection with the correct values.', () async {
    await systemUnderTest.connect(parameters: parameters);

    verify(
      () => httpClient.request(
        url: url,
        method: 'post',
        body: {'cityName': parameters.cityName},
      ),
    );
  });
}
