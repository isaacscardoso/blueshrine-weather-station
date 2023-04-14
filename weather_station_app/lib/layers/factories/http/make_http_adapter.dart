import 'package:http/http.dart';

import '../../infrastructure/http/http.dart';

class MakeHttpAdapter {
  static HttpAdapter get call => HttpAdapter(Client());

  static HttpAdapter of(Client? client) => HttpAdapter(client ?? Client());
}
