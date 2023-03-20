import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';

class ClientSpy extends Mock implements Client {
  When _mockRequestCall() => when(() => this.post(
        any(),
        headers: any(named: 'headers'),
        body: any(named: 'body'),
      ));

  void mockRequest({required String body, required int statusCode}) =>
      _mockRequestCall().thenAnswer((_) async => Response(body, statusCode));

  void mockRequestError() => _mockRequestCall().thenThrow(Exception());
}
