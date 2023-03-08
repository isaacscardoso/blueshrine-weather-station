import 'package:mocktail/mocktail.dart';

import 'package:weather_station_app/data/http/http.dart';

class HttpClientSpy extends Mock implements HttpClient {
  When mockRequestCall() => when(() => request(
        url: any(named: 'url'),
        method: any(named: 'method'),
        body: any(named: 'body'),
      ));

  void mockRequest(Map data) => mockRequestCall().thenAnswer((_) async => data);

  void mockRequestError(HttpError error) => mockRequestCall().thenThrow(error);
}
