import 'dart:convert';

import 'package:faker/faker.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import 'package:weather_station_app/data/http/http.dart';
import 'package:weather_station_app/infrastructure/http/http.dart';

import '../mocks/mocks.dart';

void main() {
  late HttpClient systemUnderTest;
  late ClientSpy client;
  late String url;
  late Uri uri;
  late Map<String, String> headers;
  late Map? body;
  late String? bodyEncoded;

  setUp(() {
    client = ClientSpy();
    systemUnderTest = HttpAdapter(client);
    headers = {
      'content-type': 'application/json',
      'accept': 'application/json',
    };
    body = {'any_key': 'any_value'};
    bodyEncoded = jsonEncode(body);
  });

  setUpAll(() {
    url = faker.internet.httpUrl();
    uri = Uri.parse(url);
    registerFallbackValue(uri);
  });

  group('shared', () {
    test('Should return InternalServerError if http method is invalid.', () async {
      client.mockRequest(body: bodyEncoded!, statusCode: 200);

      final future = systemUnderTest.request(url: url, method: '?');

      expect(future, throwsA(HttpError.internalServerError));
    });
  });

  group('post', () {
    const String method = 'post';

    setUp(() {
      client.mockRequest(body: '{}', statusCode: 200);
    });

    test('Should call the method using the correct values. ', () async {
      await systemUnderTest.request(url: url, method: method, body: body);

      verify(() => client.post(uri, headers: headers, body: bodyEncoded));
    });

    test('Should call the method without body.', () async {
      await systemUnderTest.request(url: url, method: method);

      verify(() => client.post(any(), headers: any(named: 'headers')));
    });

    test('Should return data if the method returns status 200', () async {
      client.mockRequest(body: bodyEncoded!, statusCode: 200);

      final response = await systemUnderTest.request(url: url, method: method);

      expect(response, body);
    });

    test('Should return null if method returns status 200 without data', () async {
      client.mockRequest(body: '', statusCode: 200);

      final response = await systemUnderTest.request(url: url, method: method);

      expect(response, null);
    });

    test('Should return null if method returns status 204 without data.', () async {
      client.mockRequest(body: '', statusCode: 204);

      final response = await systemUnderTest.request(url: url, method: method);

      expect(response, null);
    });

    test('Should return null if method returns status 204 with data.', () async {
      client.mockRequest(body: bodyEncoded!, statusCode: 204);

      final response = await systemUnderTest.request(url: url, method: method);

      expect(response, null);
    });

    test('Should return BadRequest if method returns status 400.', () async {
      client.mockRequest(body: bodyEncoded!, statusCode: 400);

      final future = systemUnderTest.request(url: url, method: method);

      expect(future, throwsA(HttpError.badRequest));
    });

    test('Should return NotFound if method returns status 404.', () async {
      client.mockRequest(body: bodyEncoded!, statusCode: 404);

      final future = systemUnderTest.request(url: url, method: method);

      expect(future, throwsA(HttpError.notFound));
    });

    test('Should return InternalServerError if method returns status 500.', () async {
      client.mockRequest(body: bodyEncoded!, statusCode: 500);

      final future = systemUnderTest.request(url: url, method: method);

      expect(future, throwsA(HttpError.internalServerError));
    });

    test('Should return InternalServerError if method returns unlisted status.', () async {
      client.mockRequest(body: bodyEncoded!, statusCode: 100);

      final future = systemUnderTest.request(url: url, method: method);

      expect(future, throwsA(HttpError.internalServerError));
    });

    test('Should return InternalServerError if an exception occurs in request.', () async {
      client.mockRequestError();

      final future = systemUnderTest.request(url: url, method: method);

      expect(future, throwsA(HttpError.internalServerError));
    });
  });
}