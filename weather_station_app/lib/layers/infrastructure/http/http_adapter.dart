import 'package:http/http.dart';

import '../../data/http/http.dart';
import './http.dart';

class HttpAdapter implements IHttpClient {
  final Client _client;

  HttpAdapter(this._client);

  @override
  Future<dynamic> request({
    required String url,
    required String method,
    Map? headers,
  }) async {
    final Map<String, String> defaultHeaders =
        headers?.cast<String, String>() ?? {}
          ..addAll({
            'content-type': 'application/json',
            'accept': 'application/json',
          });

    Response response = Response('', 500);
    Future<Response>? futureResponse;

    try {
      if (method == 'get') {
        futureResponse = _client.get(Uri.parse(url), headers: defaultHeaders);
      }
      if (futureResponse != null) {
        response = await futureResponse.timeout(const Duration(seconds: 10));
      }
    } catch (error) {
      throw HttpError.internalServerError;
    }
    return HttpResponseHandler.of(response);
  }
}
