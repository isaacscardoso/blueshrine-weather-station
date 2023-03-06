import 'package:http/http.dart';

import '../../data/http/http.dart';
import '../../infrastructure/http/http.dart';

HttpClient makeHttpAdapter() => HttpAdapter(Client());
