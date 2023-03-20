import 'dart:convert';

import 'package:http/http.dart';

import '../../data/http/http.dart';
import './http.dart';

class HttpAdapter implements HttpClient {
  late Client client;

  HttpAdapter(this.client);

  @override
  Future<dynamic> request({
    required String url,
    required String method,
    Map? body,
    Map? headers,
  }) async {
    final Map<String, String> defaultHeaders =
        headers?.cast<String, String>() ?? {}
          ..addAll({
            'content-type': 'application/json',
            'accept': 'application/json',
          });

    final String? jsonBody = body != null ? jsonEncode(body) : null;

    Response response = Response('', 500);

    late Future<Response>? futureResponse;

    try {
      if (method == 'post') {
        futureResponse = client.post(
          Uri.parse(url),
          headers: defaultHeaders,
          body: jsonBody,
        );
      } else if (method == 'get') {
        futureResponse = client.get(Uri.parse(url), headers: defaultHeaders);
      }
      if (futureResponse != null) {
        response = await futureResponse.timeout(const Duration(seconds: 10));
      }
    } catch (error) {
      throw HttpError.internalServerError;
    }
    return responseHandle(response);
  }
}
