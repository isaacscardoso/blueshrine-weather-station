import 'package:mocktail/mocktail.dart';

import 'package:weather_station_app/layers/data/http/http.dart';

class HttpClientSpy extends Mock implements IHttpClient {
  When mockRequestCall() => when(() => request(
        url: any(named: 'url'),
        method: any(named: 'method'),
      ));

  void mockRequest(List data) => mockRequestCall().thenAnswer((_) async => data);

  void mockRequestError(HttpError error) => mockRequestCall().thenThrow(error);
}
