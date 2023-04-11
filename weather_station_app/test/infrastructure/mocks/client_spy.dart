import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';

class ClientSpy extends Mock implements Client {
  When _mockRequestCall() => when(() => this.post(
        any(),
        headers: any(named: 'headers'),
      ));

  void mockRequest({required int statusCode}) =>
      _mockRequestCall().thenAnswer((_) async => Response('', statusCode));

  void mockRequestError() => _mockRequestCall().thenThrow(Exception());
}
