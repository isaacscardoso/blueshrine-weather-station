import 'dart:convert';

import 'package:http/http.dart';

import '../../data/http/http.dart';

class HttpResponseHandler {
  static dynamic of(Response response) {
    final int statusCode = response.statusCode;

    if (statusCode == 200) {
      return response.body.isNotEmpty ? jsonDecode(response.body) : null;
    } else if (statusCode == 204) {
      return null;
    }

    Map<int, HttpError> httpErrorResponse = {};
    for (HttpError error in HttpError.values) {
      httpErrorResponse.addAll({error.statusCode: error});
    }

    throw httpErrorResponse[statusCode] ?? HttpError.internalServerError;
  }
}
