import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mocktail/mocktail.dart';
import 'package:faker/faker.dart';
import 'package:http/http.dart';

import 'package:weather_station_app/layers/infrastructure/http/http.dart';
import 'package:weather_station_app/layers/factories/http/http.dart';

import '../../data/mocks/http_client_spy.dart';
import '../mocks/api_url_factory.dart';
import '../mocks/api_factory.dart';
import '../mocks/client_spy.dart';

void main() async {
  late HttpAdapter systemUnderTest;
  late ClientSpy client;
  late String urlMetereology;
  late String urlGeolocation;

  await dotenv.load(fileName: '.env');

  setUp(() {
    client = ClientSpy();
    systemUnderTest = MakeHttpAdapter.of(Client());
  });

  setUpAll(() {
    urlMetereology = ApiUrlFactory.meteorology(
      cityName: 'Formiga',
      limit: '1',
    );
    registerFallbackValue(Uri.parse(urlMetereology));

    urlGeolocation = ApiUrlFactory.geolocation(
      latitude: -20.4648425,
      longitude: -45.4266753,
    );

    registerFallbackValue(Uri.parse(urlGeolocation));
  });

  test('', () async {
    client.mockRequest(statusCode: 200);

    final response = await systemUnderTest.request(
      url: urlMetereology,
      method: 'get',
    );
    print(response);
  });

  test('', () async {
    client.mockRequest(statusCode: 200);

    final response = await systemUnderTest.request(
      url: urlGeolocation,
      method: 'get',
    );
    print(response);
  });
}
