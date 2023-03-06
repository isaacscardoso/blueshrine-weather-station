import 'dart:convert';

import 'package:http/http.dart';

import '../../data/http/http.dart';

dynamic responseHandle(Response response) {
  final int statusCode = response.statusCode;
  final String body = response.body;
  final Map<int, dynamic> treatmentForEachStatusCode = {
    200: body.isNotEmpty ? jsonDecode(body) : null,
    204: null,
  };

  if (treatmentForEachStatusCode.containsKey(statusCode)) {
    return treatmentForEachStatusCode[statusCode];
  }

  Map<int, HttpError> httpErrorResponse = {};
  for (HttpError error in HttpError.values) {
    httpErrorResponse.addAll({error.statusCode: error});
  }

  throw httpErrorResponse[statusCode] ?? HttpError.internalServerError;
}
