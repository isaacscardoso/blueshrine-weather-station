import 'package:http/http.dart';

import '../../infrastructure/http/http.dart';

class MakeHttpAdapter {
  static HttpAdapter of(Client client) => HttpAdapter(client);
}
