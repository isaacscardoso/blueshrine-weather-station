import 'package:faker/faker.dart';

import 'package:weather_station_app/domain/usecases/usecases.dart';

class ParametersFactory {
  static HttpConnectionParameters connect() {
    return HttpConnectionParameters(cityName: faker.address.city());
  }
}
