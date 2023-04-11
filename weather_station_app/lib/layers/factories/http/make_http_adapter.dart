import 'package:http/http.dart';

import '../../data/http/http.dart';
import '../../infrastructure/http/http.dart';

class MakeHttpAdapter {
  static IHttpClient of(Client client) => HttpAdapter(client);
}
